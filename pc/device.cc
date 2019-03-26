#include "common.h"
#include "screen.h"

#include <stdio.h>
#include <stdint.h>
#include <string.h>
#include <errno.h>
#include <poll.h>
#include <unistd.h>
#include <sys/time.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>
#include <pthread.h>
#include <signal.h>

#include <libusb.h>

#define MAX_SAMPLES     1200

libusb_context          *ctx;
libusb_device           **devices;
libusb_device_handle    *dh;

uint16_t                num_samples = 1028;
uint16_t                samples[MAX_SAMPLES];
double                  sampling_interval;
#ifdef DO_RESAMPLE
uint16_t                resampled[MAX_SAMPLES];
double                  raw_sampling_interval;
#endif // DO_RESAMPLE

uint8_t                 cmd = scope_command_t::NORMAL;
uint16_t                send_pwm_total, send_pwm_duty;
uint8_t                 custom_event_idx;

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

#ifdef DO_RESAMPLE
uint16_t
resample(uint16_t *dst, uint16_t old_n, const uint16_t *src) {
    uint16_t new_n = (int)(old_n * raw_sampling_interval / sampling_interval);
    int sidx = 0, didx = 0;
    double t = 0;

    if (new_n > MAX_SAMPLES)
        new_n = MAX_SAMPLES;

    //fprintf(stderr, "resample from (n=%d, iv=%f) to (n=%d, iv=%f) \n", old_n, raw_sampling_interval * 1e6, new_n, sampling_interval * 1e6);
    while (didx < new_n) {
        dst[didx] = src[sidx];
        didx++;

        t += sampling_interval;

        int skip = (int)(t / raw_sampling_interval);
        sidx += skip;
        t -= raw_sampling_interval * skip;
    }
    //fprintf(stderr, "resample done, dst=%d, src=%d\n", didx, sidx);

    return new_n;
}
#endif // DO_RESAMPLE


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
        switch (cmd) {
            case scope_command_t::SEND_PWM: {
                cmd = scope_command_t::NORMAL;
                request[0] = 'P'; // command: pwm
                request[1] = 0;
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
                cmd = scope_command_t::NORMAL;
                request[0] = 'E'; // command: pwm
                request[1] = custom_event_idx;
                request[2] = 0;
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

            case scope_command_t::NORMAL: {
                request[0] = 'A'; // command: analog sweep
                request[1] = trig_dir + trig_source;
                request[2] = ( num_samples       & 0xff);
                request[3] = ((num_samples >> 8) & 0xff);
                request[4] = ( (trig_level << 4)        & 0xff);
                request[5] = (((trig_level << 4)  >> 8) & 0xff);
                request[6] = sample_rate;
                request[7] = 0;

                n = 0;
                res = libusb_bulk_transfer(dh, 0x01, request, 8, &n, 1000);
                if (res != LIBUSB_SUCCESS) // FIXME: could not send data
                    continue;

                n = 0;
                //fprintf(stderr, "receiving analog... ");
                res = libusb_bulk_transfer(dh, 0x81, (unsigned char*)samples, num_samples * sizeof(samples[0]), &n, 0);
                //fprintf(stderr, "got %d bytes, res=%d\n", n, res);
                if (res != LIBUSB_SUCCESS) // FIXME: reception error
                    continue;

                n /= sizeof(samples[0]);
#ifdef DO_RESAMPLE
                n = resample(resampled, n, samples);
                add_analog_samples(n, &resampled[0]);
#else // DO_RESAMPLE
                add_analog_samples(n, &samples[0]);
#endif // DO_RESAMPLE

                request[0] = 'D'; // command: analog sweep
                request[1] = trig_dir + trig_source;
                request[2] =  num_samples       & 0xff;
                request[3] = (num_samples >> 8) & 0xff;
                n = 14 * (sample_rate + 1) - 1;
                request[4] =  n       & 0xff;
                request[5] = (n >> 8) & 0xff;
                request[6] = 0;
                request[7] = 0;

                n = 0;
                res = libusb_bulk_transfer(dh, 0x01, request, 8, &n, 1000);
                if (res != LIBUSB_SUCCESS) // FIXME: could not send data
                    continue;

                n = 0;
                //fprintf(stderr, "receiving digital... ");
                res = libusb_bulk_transfer(dh, 0x81, (unsigned char*)samples, num_samples * sizeof(samples[0]), &n, 0);
                //fprintf(stderr, "got %d bytes, res=%d\n", n, res);
                if (res != LIBUSB_SUCCESS) // FIXME: reception error
                    continue;

                n /= sizeof(samples[0]);
#ifdef DO_RESAMPLE
                n = resample(resampled, n, samples);
                add_digital_samples(n, &resampled[0]);
#else // DO_RESAMPLE
                add_digital_samples(n, &samples[0]);
#endif // DO_RESAMPLE
            }
            break;
        }
    }
    fprintf(stderr, "exited thread loop\n");
    return nullptr;
}


void
set_sample_rate(uint8_t n) {
    printf("sample_rate=%d\n", n);
    sample_rate = n;
    // minimal conversion interval in nsec
    static double base = 1000.0 * 7 / 72;
    // 72 is the CPU freq in MHz, conversion interval is 7 clks
    // so 7 / 72 is the conversion interval in usec (would be, without the prescaler),
    // so 1000 times that is in nsec

    // prescaler values for 0..3 are 2, 4, 6, 8, that is, 2*(n+1)
    sampling_interval = 2 * (sample_rate + 1) * base * 1e-9;

#ifdef DO_RESAMPLE
    raw_sampling_interval = sampling_interval;
    // will be resampled to these rates
    switch (sample_rate) {
        case 0: sampling_interval =  20e-8; break;
        case 1: sampling_interval =  50e-8; break;
        case 3: sampling_interval = 100e-8; break;
    }
#endif // DO_RESAMPLE

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
    while (cmd != scope_command_t::NORMAL)
        ;
    send_pwm_total = total;
    send_pwm_duty = duty;
    cmd = scope_command_t::SEND_PWM;
    pthread_kill(thr_sampling, SIGUSR1);
}

void send_custom_event(uint8_t n) {
    while (cmd != scope_command_t::NORMAL)
        ;
    custom_event_idx = n;
    cmd = scope_command_t::SEND_CUSTOM_EVENT;
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
init_device(const char *devname) {
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
