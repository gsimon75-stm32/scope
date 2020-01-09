#include "common.h"
#include "screen.h"

#include <stdio.h>
#include <stdint.h>
#include <string.h>
#include <errno.h>
#include <poll.h>
#include <unistd.h>
#include <sys/endian.h>
#include <sys/time.h>
#include <sys/types.h>
#include <sys/wait.h>
#include <sys/stat.h>
#include <fcntl.h>
#include <pthread.h>
#include <signal.h>

#include <libusb.h>

#define MAX_SAMPLES     2000
#define SAMPLING_OVERHEAD_TIME 1.8e-6

libusb_context          *ctx;
libusb_device           **devices;
libusb_device_handle    *dh;

uint8_t                 raw_samples_data[5 * MAX_SAMPLES];

uint16_t                num_raw_samples = 1028;
double                  raw_sampling_interval;
sample_t                raw_samples[MAX_SAMPLES];

uint16_t                num_samples;
double                  sampling_interval;
sample_t                samples[MAX_SAMPLES];

uint8_t                 cmd = scope_command_t::SWEEP;
bool                    do_pause = false;
uint16_t                send_pwm_total, send_pwm_duty;
uint8_t                 custom_event_idx;

const sampling_preset_t sampling_presets[] = {
  //            intrleaved, sidx,   psc,    s.interval, raw s.intv.
  /* [0] */   { true,       0,      0,      200e-9 }, // 389e-9 / 2 (because of the interleaved sampling and the single channel)
  /* [1] */   { false,      0,      0,      500e-9 }, // 389e-9
  /* [2] */   { false,      0,      1,        1e-6 }, // 778e-9
  /* [3] */   { false,      1,      2,        2e-6 }, // 1.67e-6
  /* [4] */   { false,      4,      2,        5e-6 }, // 4.5e-6
  /* [5] */   { false,      6,      2,       10e-6 }, // 7e-6
  /* [6] */   { false,      7,      1,       20e-6 }, // 14e-6
  /* [7] */   { false,      7,      3,       50e-6 }, // 28e-6

  /*
  { false,      0,      0,      500e-9 }, // 389e-9
  { false,      1,      0,        1e-6 }, // 556e-9
  { false,      2,      0,        1e-6 }, // 722e-9
  { false,      3,      0,        2e-6 }, // 1.14e-6
  { false,      4,      0,        2e-6 }, // 1.5e-6
  { false,      5,      0,        2e-6 }, // 1.89e-6
  { false,      6,      0,        5e-6 }, // 2.3e-6
  { false,      7,      0,       10e-6 }, // 7e-6

  { false,      0,      1,        1e-6 }, // 778e-9
  { false,      1,      1,        2e-6 }, // 1.11e-6
  { false,      2,      1,        2e-6 }, // 1.44e-6
  { false,      3,      1,        5e-6 }, // 2.28e-6
  { false,      4,      1,        5e-6 }, // 3e-6
  { false,      5,      1,        5e-6 }, // 3.78e-6
  { false,      6,      1,        5e-6 }, // 4.67e-6
  { false,      7,      1,       20e-6 }, // 14e-6

  { false,      0,      2,        2e-6 }, // 1.17e-6
  { false,      1,      2,        2e-6 }, // 1.67e-6
  { false,      2,      2,        5e-6 }, // 2.17e-6
  { false,      3,      2,        5e-6 }, // 3.42e-6
  { false,      4,      2,        5e-6 }, // 4.5e-6
  { false,      5,      2,       10e-6 }, // 5.67e-6
  { false,      6,      2,       10e-6 }, // 7e-6
  { false,      7,      2,       50e-6 }, // 21e-6

  { false,      0,      3,        2e-6 }, // 1.56e-6
  { false,      1,      3,        5e-6 }, // 2.22e-6
  { false,      2,      3,        5e-6 }, // 2.89e-6
  { false,      3,      3,        5e-6 }, // 4.56e-6
  { false,      4,      3,       10e-6 }, // 6e-6
  { false,      5,      3,       10e-6 }, // 7.56e-6
  { false,      6,      3,       10e-6 }, // 9.3e-6
  { false,      7,      3,       50e-6 }, // 28e-6
  */
};
const sampling_preset_t *current_sampling_preset = &sampling_presets[0];
const int NUM_SAMPLING_PRESETS = sizeof(sampling_presets) / sizeof(sampling_presets[0]);

#define VENDOR  0x5AFE
#define PRODUCT 0x7E57
#define MANUFACTURER  "gsimon75"
#define PRODUCT_NAME  "STM32 Scope"

#include <SDL.h>


sigset_t sigset_comm;
pthread_t thr_sampling = nullptr;

void sigusr1_handler(int n) {
    //fprintf(stderr, "SIGUSR1 caught: %p\n", pthread_self());
}

void sighup_handler(int n) {
    //fprintf(stderr, "SIGHUP caught: %p\n", pthread_self());
    cmd = scope_command_t::QUIT;
}

void*
main_loop(void *userdata) {
    int res;
    struct sigaction sa = { nullptr, 0, 0 };

    fprintf(stderr, "entering thread loop\n");
    sa.sa_handler = &sigusr1_handler;
    res = sigaction(SIGUSR1, &sa, nullptr);
    if (res < 0)
        fprintf(stderr, "sigaction failed (%d) %s\n", errno, strerror(errno));
    sa.sa_handler = &sighup_handler;
    res = sigaction(SIGHUP, &sa, nullptr);
    if (res < 0)
        fprintf(stderr, "sigaction failed (%d) %s\n", errno, strerror(errno));
    res = pthread_sigmask(SIG_UNBLOCK, &sigset_comm, nullptr);
    if (res < 0)
        fprintf(stderr, "pthread_sigmask failed (%d)\n", res);

    uint8_t request[8];
    int n;
    while (cmd != scope_command_t::QUIT) {
        if (do_pause) {
            sigset_t sigset_current;
            pthread_sigmask(0, nullptr, &sigset_current);
            sigsuspend(&sigset_current);
        }

        switch (cmd) {
            case scope_command_t::SEND_PWM: {
                cmd = scope_command_t::SWEEP;
                request[0] = LIBUSB_ENDPOINT_OUT | LIBUSB_REQUEST_TYPE_VENDOR | LIBUSB_RECIPIENT_ENDPOINT;
                request[1] = 'P'; // command: pwm
                request[2] = ( send_pwm_total       & 0xff);
                request[3] = ((send_pwm_total >> 8) & 0xff);
                request[4] = ( send_pwm_duty        & 0xff);
                request[5] = ((send_pwm_duty  >> 8) & 0xff);
                request[6] = 0;
                request[7] = 0;

                n = 0;
                res = libusb_bulk_transfer(dh, 0x01, request, 8, &n, 1000);
                if (res != LIBUSB_SUCCESS) // FIXME: could not send data
                    continue;
            }
            break;

            case scope_command_t::SEND_CUSTOM_EVENT: {
                cmd = scope_command_t::SWEEP;
                request[0] = LIBUSB_ENDPOINT_OUT | LIBUSB_REQUEST_TYPE_VENDOR | LIBUSB_RECIPIENT_ENDPOINT;
                request[1] = 'E'; // command: event
                request[2] = custom_event_idx;
                request[3] = 0;
                request[4] = 0;
                request[5] = 0;
                request[6] = 0;
                request[7] = 0;

                n = 0;
                res = libusb_bulk_transfer(dh, 0x01, request, 8, &n, 1000);
                if (res != LIBUSB_SUCCESS) // FIXME: could not send data
                    continue;
            }
            break;

            case scope_command_t::SWEEP: {
                num_raw_samples = (int)(1024 * sampling_interval / raw_sampling_interval);
                request[0] = LIBUSB_ENDPOINT_IN | LIBUSB_REQUEST_TYPE_VENDOR | LIBUSB_RECIPIENT_ENDPOINT;
                request[1] = 'S'; // command: sweep
                request[2] = (current_sampling_preset->is_interleaved ? 0x80 : 0) |  ((current_sampling_preset->sampling_time_idx & 7) << 2) | (current_sampling_preset->sample_rate & 3);
                request[3] = trig_dir + trig_source;
                request[4] = ( (trig_level << 4)        & 0xff);
                request[5] = (((trig_level << 4)  >> 8) & 0xff);
                request[6] = ( num_raw_samples       & 0xff);
                request[7] = ((num_raw_samples >> 8) & 0xff);

                n = 0;
                res = libusb_bulk_transfer(dh, 0x01, request, 8, &n, 1000);
                if (res != LIBUSB_SUCCESS) // FIXME: could not send data
                    continue;

                int data_len = num_raw_samples * (current_sampling_preset->is_interleaved ? 3 : 5);
                n = 0;
                res = libusb_bulk_transfer(dh, 0x81, raw_samples_data, data_len, &n, 0);
                //fprintf(stderr, "got %d bytes, res=%d\n", n, res);
                if (res != LIBUSB_SUCCESS) // FIXME: reception error
                    continue;

                // pad with zero-samples to represent the sampling overhead time (from trig to 0th sample)
                n = (int)(SAMPLING_OVERHEAD_TIME / raw_sampling_interval);
                for (int i = 0; i < n; ++i) {
                    raw_samples[i].analog[0] = raw_samples[i].analog[1] = 0;
                    raw_samples[i].digital = 0;
                }
                num_raw_samples += n;

                // split raw samples' data to (structured) samples
                uint8_t *p = raw_samples_data;
                if (current_sampling_preset->is_interleaved) {
                    // NOTE: This mode is used for sampling the *same* signal with two channels, interleaving the sampling times,
                    // so what we have here is a 'mono' signal represented as a 'stereo' with half the length.
                    for (int i = n; i < num_raw_samples; i += 2, p += 4) {
                        raw_samples[i].analog[0] = raw_samples[i].analog[1] = le16dec(p);
                        raw_samples[i + 1].analog[0] = raw_samples[i + 1].analog[1] = le16dec(p + 2);
                    }
                    for (int i = n; i < num_raw_samples; ++i, ++p) {
                        raw_samples[i].digital = *p;
                    }
                }
                else {
                    for (int i = n; i < num_raw_samples; ++i, p += 4) {
                        raw_samples[i].analog[0] = le16dec(p);
                        raw_samples[i].analog[1] = le16dec(p + 2);
                    }
                    for (int i = n; i < num_raw_samples; ++i, ++p) {
                        raw_samples[i].digital = *p;
                    }
                }

                // Resample the data to get a desired sampling rate
                num_samples = (int)(num_raw_samples * raw_sampling_interval / sampling_interval);

                //printf("num_raw_samples=%d, raw_sampling_interval=%lg, num_samples=%d, sampling_interval=%lg\n", num_raw_samples, raw_sampling_interval, num_samples, sampling_interval);
                int src = 0; // source sample index
                int dst = 0; // dest sample index
                double t = 0; // time processed so far
                double i_analog[2], i_digital[8]; // cumulative integrals (values integrated so far)
                for (int i = 0; i < 2; ++i) {
                    i_analog[i] = 0;
                }
                for (int i = 0; i < 8; ++i) {
                    i_digital[i] = 0;
                }

                while ((src < num_raw_samples) && (dst < num_samples)) {
                    //printf("src=%d, dst=%d, t=%lg\n", src, dst, t);

                    /* generate as many output as we can from the samples we integrated */
                    while ((t >= sampling_interval) && (dst < num_samples)) {
                        //printf("i_analog[0]/t = %lg\n", i_analog[0] / t);
                        for (int i = 0; i < 2; ++i) {
                            double d = i_analog[i] / t;

                            i_analog[i] -= d * sampling_interval;
                            samples[dst].analog[i] = d;
                        }
                        samples[dst].digital = 0;
                        for (int i = 0; i < 8; ++i) {
                            double d = i_digital[i] / t;

                            i_digital[i] -= d * sampling_interval;
                            if (d >= 0.5) {
                                samples[dst].digital |= (1 << i);
                            }
                        }
                        //printf("generated %u -> %lg\n", samples[dst].analog[0], i_analog[0]);
                        ++dst;
                        t -= sampling_interval;
                    }

                    // integrate a source sample
                    for (int i = 0; i < 2; ++i) {
                        i_analog[i] += raw_sampling_interval * raw_samples[src].analog[i];
                    }
                    for (int i = 0; i < 8; ++i) {
                        if ((raw_samples[src].digital & (1 << i)) != 0) {
                            i_digital[i] += raw_sampling_interval * 1;
                        }
                    }
                    //printf("added %u -> %lg\n", raw_samples[src].analog[0], i_analog[0]);
                    ++src;
                    t += raw_sampling_interval;
                }
                add_samples(dst, samples);
                //add_samples(num_raw_samples, raw_samples);
            }
            break;
        }
    }
    fprintf(stderr, "exited thread loop\n");
    return nullptr;
}


const int adc_conv_cycles[8] = { 14, 20, 26, 41, 54, 68, 84, 252 };

void
set_sampling_preset(uint8_t n) {
    printf("sampling_preset=%d\n", n);
    current_sampling_preset_idx = n;
    current_sampling_preset = &sampling_presets[current_sampling_preset_idx];

    // calculate the raw sampling interval

    // raw sampling interval = cycles_per_conversion / (fCPU / prescaler) 

    // cycles_per_conversion depends on the sampling_time_idx param of the current preset, see adc_conv_cycles[]
    // fCPU = 72 MHz = 72e6 Hz
    // prescaler codes 0,1,2,3 mean divisor values 2,4,6,8, that is, 2*(n+1)

    // raw sampling interval = conv_cycles[sidx] * 2 * (psc+1) / fCPU = conv_cycles[sidx] * (psc+1) / 36e6

    raw_sampling_interval = adc_conv_cycles[current_sampling_preset->sampling_time_idx] * (current_sampling_preset->sample_rate + 1) / 36e6;
    
    if (current_sampling_preset->is_interleaved) {
        raw_sampling_interval /= 2;
    }

    // will be resampled to these rates
    sampling_interval = current_sampling_preset->sampling_interval;

    printf("raw_sampling_interval=%lf, sampling_interval=%lf\n", raw_sampling_interval * 1e6, sampling_interval * 1e6);

    pthread_kill(thr_sampling, SIGUSR1);
}

void
set_trig_level(uint8_t n) {
    printf("trig_level=0x%02x\n", n);
    trig_level = n;
    pthread_kill(thr_sampling, SIGUSR1);
}

void
set_trig_dir(uint8_t n) {
    printf("trig_dir=%d\n", n);
    trig_dir = n;
    pthread_kill(thr_sampling, SIGUSR1);
}

void
set_trig_source(uint8_t n) {
    printf("trig_source=%d\n", n);
    trig_source = n;
    pthread_kill(thr_sampling, SIGUSR1);
}

void set_pwm(uint16_t total, uint16_t duty) {
    while (cmd != scope_command_t::SWEEP)
        ;
    send_pwm_total = total;
    send_pwm_duty = duty;
    cmd = scope_command_t::SEND_PWM;
    pthread_kill(thr_sampling, SIGUSR1);
}

void send_custom_event(uint8_t n) {
    while (cmd != scope_command_t::SWEEP)
        ;
    custom_event_idx = n;
    cmd = scope_command_t::SEND_CUSTOM_EVENT;
    pthread_kill(thr_sampling, SIGUSR1);
}

void
resume(void) {
    pthread_kill(thr_sampling, SIGUSR1);
}

bool
check_device_string(int id, const char *shouldbe) {
    char text[1024];

    if (id == 0)
        return false;

    int res = libusb_get_string_descriptor_ascii(dh, id, (uint8_t*)&text, sizeof(text));
    if (res < 0)
        return false;

    text[res] = '\0';
    return !strcmp(text, shouldbe);
}

bool
init_device(void) {
    int res;

    res = libusb_init(&ctx);
    if (res != LIBUSB_SUCCESS)
        return false; // die("libusb_init failed", res);

    int len = libusb_get_device_list(ctx, &devices);
    for (int i = 0; i < len; ++i) {
        libusb_device_descriptor descr_dev;

        res = libusb_get_device_descriptor(devices[i], &descr_dev);
        if (res != LIBUSB_SUCCESS)
            return false; // die("libusb_get_device_descriptor failed", res);

        if ((descr_dev.idVendor == VENDOR) && (descr_dev.idProduct == PRODUCT)) {
            res = libusb_open(devices[i], &dh);
            if (res != LIBUSB_SUCCESS)
                return false; // die("libusb_open failed", res);

            if (check_device_string(descr_dev.iManufacturer, MANUFACTURER) &&
                check_device_string(descr_dev.iProduct, PRODUCT_NAME)) {
                // gotcha!
                break;
            }
            libusb_close(dh);
            dh = NULL;
        }
    }
    libusb_free_device_list(devices, 1);
    if (!dh)
        return false; // die("Could not find device", LIBUSB_ERROR_OTHER);
    // now we have the device

    sigemptyset(&sigset_comm);
    sigaddset(&sigset_comm, SIGUSR1);
    sigaddset(&sigset_comm, SIGHUP);
    pthread_sigmask(SIG_BLOCK, &sigset_comm, nullptr);

    fprintf(stderr, "creating thread\n");
    res = pthread_create(&thr_sampling, nullptr, main_loop, nullptr);
    return res == 0;
}

void
shutdown_device() {
    cmd = scope_command_t::QUIT;
    printf("waiting for thread\n");
    if (thr_sampling) {
        pthread_kill(thr_sampling, SIGHUP);
        pthread_join(thr_sampling, nullptr);
    }
    libusb_close(dh);
    libusb_exit(ctx);
}

#if 0
    // resampling code, but it handles only up-sampling (raw_sampling_interval <= sampling_interval)

                while ((src < num_raw_samples) && (dst < num_samples)) {

                    // integrate all source samples that fall entirely within the current dest sample
                    while ((t + raw_sampling_interval) <= sampling_interval) {
                        for (int i = 0; i < 2; ++i) {
                            i_analog[i] += raw_samples[src].analog[i] * raw_sampling_interval;
                        }
                        for (int i = 0; i < 8; ++i) {
                            if ((raw_samples[src].digital & (1 << i)) != 0) {
                                i_digital[i] += 1 * raw_sampling_interval;
                            }
                        }
                        ++src;
                        t += raw_sampling_interval;
                    }

                    double t_this;

                    // the next source sample falls only partially within the current dest sample
                    // integrate the covered part of it
                    t_this = sampling_interval - t;
                    for (int i = 0; i < 2; ++i) {
                        i_analog[i] += raw_samples[src].analog[i] * t_this;
                    }
                    for (int i = 0; i < 8; ++i) {
                        if ((raw_samples[src].digital & (1 << i)) != 0) {
                            i_digital[i] += 1 * t_this;
                        }
                    }

                    // form the new sample to represent the integrated values
                    for (int i = 0; i < 2; ++i) {
                        samples[dst].analog[i] = i_analog[i] / sampling_interval;
                        i_analog[i] = 0;
                    }
                    samples[dst].digital = 0;
                    for (int i = 0; i < 8; ++i) {
                        if (i_digital[i] >= (0.5 * sampling_interval)) {
                            samples[dst].digital |= (1 << i);
                        }
                        i_digital[i] = 0;
                    }
                    ++dst;

                    // integrate the remainder of that partially covered source sample
                    double t_that = raw_sampling_interval - t_this;
                    for (int i = 0; i < 2; ++i) {
                        i_analog[i] += raw_samples[src].analog[i] * t_that;
                    }
                    for (int i = 0; i < 8; ++i) {
                        if ((raw_samples[src].digital & (1 << i)) != 0) {
                            i_digital[i] += 1 * t_that;
                        }
                    }

                    // seek the source until the end of that partially covered sample
                    t = t_that;
                    ++src;
                }
#endif
