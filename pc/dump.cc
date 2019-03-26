#include <fcntl.h>
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/stat.h>
#include <sys/types.h>
#include <unistd.h>
#include <poll.h>
#include <ctype.h>
#if __LINUX__
#   include <sys/ioctl.h>
#   include <asm/ioctls.h>
#   include <asm/termbits.h>
#elif __FreeBSD__
#   include <termios.h>
#endif
#include <errno.h>

int
main(int argc, char **argv) {
    int res;
    struct termios tio_stdin_orig;
    struct termios tio;
    struct pollfd pfd[2];

    tcgetattr(0, &tio_stdin_orig);
    tcgetattr(0, &tio);
    tio.c_lflag &= ~(ICANON | ECHO);
    tio.c_cc[VMIN] = 0;
    tio.c_cc[VTIME] = 0;
    tcsetattr(0, TCSANOW, &tio);

    tio.c_iflag = INPCK | IGNPAR;
    tio.c_oflag = 0;
    //tio.c_cflag = CREAD | CS8 | PARENB | CRTSCTS | B115200;
    tio.c_cflag = CREAD | CS8 | PARENB;
    tio.c_lflag = 0;
    memset(tio.c_cc, 0, sizeof(tio.c_cc));
    tio.c_cc[VMIN] = 1;
    tio.c_cc[VTIME] = 0;

#if __LINUX__
    int fd_serial = open("/dev/ttyUSB1", O_RDWR);
    ioctl(fd_serial, TCSETS, &tio);

    {
        struct termios2 tio2;

        ioctl(fd_serial, TCGETS2, &tio2);
        tio2.c_cflag &= ~CBAUD;
        tio2.c_cflag |= BOTHER;
        tio2.c_ispeed = tio2.c_ospeed = 250000;
        ioctl(fd_serial, TCSETS2, &tio2);
    }
#elif __FreeBSD__
    int fd_serial = open("/dev/ttyU1", O_RDWR);
    //tio.c_ispeed = tio.c_ospeed = 115200; // ok
    if (argc > 1)
        tio.c_ispeed = tio.c_ospeed = atol(argv[1]);
    else
        tio.c_ispeed = tio.c_ospeed = 250000;
    //tio.c_ispeed = tio.c_ospeed = 2000000;
    //tio.c_ispeed = tio.c_ospeed = 8000000;
    res = tcsetattr(fd_serial, TCSANOW, &tio);
    fprintf(stderr, "tcsetattr: %d, err=%s\n", res, strerror(errno));
    memset(&tio, 0, sizeof(struct termios));
    res = tcgetattr(fd_serial, &tio);
    fprintf(stderr, "tcgetattr: %d, ispd=%u, ospd=%u\n", res, tio.c_ispeed, tio.c_ospeed);
#endif
    {
        int i = FREAD | FWRITE;
        res = ioctl(fd_serial, TIOCFLUSH, &i);
        fprintf(stderr, "TIOCFLUSH: %d, err=%s\n", res, strerror(errno));

    }

    pfd[0].fd = 0;
    pfd[0].events = POLLIN;

    pfd[1].fd = fd_serial;
    pfd[1].events = POLLIN;

    fcntl(0, F_SETFL, O_NONBLOCK);
    fcntl(fd_serial, F_SETFL, O_NONBLOCK);

    while (1) {
        uint8_t values[1024];
        ssize_t len;

        pfd[0].revents = pfd[1].revents = 0;
        res = poll(pfd, 2, INFTIM);

        if (pfd[0].revents & POLLIN) {
            len = read(0, values, 1);
            if ((len < 0) && ((errno != EAGAIN) && (errno != EINTR)))
                break;

            if (len > 0) {
                if (isprint(values[0])) {
                    printf("\x1b[7m%c\x1b[0m", values[0]);
                    fflush(stdout);
                }
                if (values[0] == '\x1b')
                    break;
                write(fd_serial, values, len);
            }
        }

        if (pfd[1].revents & POLLIN) {
            len = read(fd_serial, values, sizeof(values));
            if ((len < 0) && ((errno != EAGAIN) && (errno != EINTR)))
                break;

            if (len > 0) {
                for (int i = 0; i < len; ++i)
                    printf(" %02x", values[i]);
                fflush(stdout);
                //write(1, values, len);
            }
        }
    }
    tcsetattr(0, TCSANOW, &tio_stdin_orig);

    close(fd_serial);
    return 0;

}
