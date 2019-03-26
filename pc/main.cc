#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <stdint.h>
#include <errno.h>
#include <signal.h>
#include <libusb.h>

libusb_context          *ctx;
libusb_device           **devices;
libusb_device_handle    *dh;

#define VENDOR  0x5AFE
#define PRODUCT 0x7E57
#define SERIAL  "1029384756"

struct trig_direction_t {
    enum {
        NONE    = 0x07,
        RISING  = 0x04,
        FALLING = 0x01,
    };
};

struct trig_source_t {
    enum {
        NONE    = 0x00,
        ANALOG  = 0x08,
        DIGITAL = 0x10,
    };
};


void
die(const char *msg, int error_code) {
    fprintf(stderr, "%s: %s (%d=%s)\n", msg, libusb_strerror(error_code), error_code, libusb_error_name(error_code));
    exit(error_code);
}


bool do_quit = false;

void sigint_handler(int n) {
    fprintf(stderr, "signal caught\n");
    do_quit = true;
}

struct  sigaction sa = {
    &sigint_handler,
    0,
    0
};


int
main(int argc, char **argv) {
    int res, i, n;
    ssize_t len;
    uint8_t request[8];
    uint16_t num_samples, trig_level;
    uint16_t samples[1024];

    sigemptyset(&sa.sa_mask);
    res = sigaction(SIGINT, &sa, nullptr);
    if (res == -1)
        die("sigaction failed", errno);

    res = libusb_init(&ctx);
    if (res != LIBUSB_SUCCESS)
        die("libusb_init failed", res);

    len = libusb_get_device_list(ctx, &devices);
    for (i = 0; i < len; ++i) {
        libusb_device_descriptor descr_dev;

        res = libusb_get_device_descriptor(devices[i], &descr_dev);
        if (res != LIBUSB_SUCCESS)
            die("libusb_get_device_descriptor failed", res);

        printf("device %d: idVendor=0x%04x, idProduct=0x%04x, iSerialNumber=%d\n",
                i, descr_dev.idVendor, descr_dev.idProduct, descr_dev.iSerialNumber);

        if ((descr_dev.idVendor == VENDOR) && (descr_dev.idProduct == PRODUCT)) {
            char serial[1024];

            res = libusb_open(devices[i], &dh);
            if (res != LIBUSB_SUCCESS)
                die("libusb_open failed", res);

            res = libusb_get_string_descriptor_ascii(dh, descr_dev.iSerialNumber, (uint8_t*)&serial, sizeof(serial));
            if (res < 0)
                die("Could not get device serial", res);
            serial[res] = '\0';
            if (strcmp(serial, SERIAL)) {
                libusb_close(dh);
                dh = NULL;
            }
            else {
                // gotcha!
                break;
            }

        }
    }
    libusb_free_device_list(devices, 1);
    if (!dh)
        die("Could not find device", LIBUSB_ERROR_OTHER);

    // now we have the device
    printf("Device found!\n");

    num_samples = 200;
    trig_level = 0x7f0;

    while (true) {
        request[0] = 'A'; // command: analog sweep
        //request[1] = trig_source_t::ANALOG + trig_direction_t::FALLING;
        request[1] = trig_source_t::ANALOG + trig_direction_t::RISING;
        //request[1] = trig_source_t::ANALOG + trig_direction_t::NONE;
        request[2] = ( num_samples       & 0xff);
        request[3] = ((num_samples >> 8) & 0xff);
        request[4] = ( trig_level        & 0xff);
        request[5] = ((trig_level  >> 8) & 0xff);
        //request[6] = (2 << 3) + 7; // prescaler=3, sampling time=7
        request[6] = (0 << 3) + 0; // prescaler=3, sampling time=7
        i = 0;
        res = libusb_bulk_transfer(dh, 0x01, request, 8, &i, 1000);
        if (res != LIBUSB_SUCCESS)
            die("Could not send data", res);
        printf("Sent %d bytes\n", i);

        n = 0;
        res = libusb_bulk_transfer(dh, 0x81, (unsigned char*)samples, num_samples * sizeof(samples[0]), &n, 0);
        if (res != LIBUSB_SUCCESS)
            die("Could not receive data", res);
        n /= sizeof(samples[0]);

        printf("Received %d samples\n", n);
        for (int i = 0; i < n; ++i)
            printf(" 0x%03x", samples[i]);
        printf("\n");
    }

    libusb_close(dh);
    libusb_exit(ctx);
    return 0;
}

// vim: set sw=4 ts=4 et:
