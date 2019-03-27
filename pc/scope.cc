#include "common.h"
#include "screen.h"
#include "device.h"
#include "ui.h"

#include <stdint.h>
#include <stdio.h>
#include <unistd.h>
#include <string.h>
#include <errno.h>
#include <fcntl.h>
#include <getopt.h>
#include <SDL.h>

#include <stdexcept>

SDL_Renderer *renderer;
uint32_t user_event_type_base;

uint8_t sample_rate = 3;
uint8_t trig_dir = trig_direction_t::RISING;
uint8_t trig_source = trig_source_t::ANALOG;
uint8_t trig_level = 0x80;

uint16_t pwm_total = 576; // 125 kHz
uint16_t pwm_duty = pwm_total / 2;
// for adaptive increase/decrease
int pwm_step = 1;
int pwm_count = 0;


void
help(const char *myname) {
    printf("Usage: %s [options]\n", myname);
    printf("  -h | --help\n");
    printf("  -r | --rate n             Sample Rate, 0..7\n");
    printf("  -d | --trig-dir n         Trig Direction, 7=off, 4=rising, 1=falling\n");
    printf("  -s | --trig-src n         Trig Source, 0=off, 8=analog, 16=digital\n");
    printf("  -l | --trig-level n       Trig Level, 0..255\n");
}

void
commit_pwm(void) {
    fprintf(stderr, "pwm: %u/%u (step=%d, count=%d)\n", pwm_duty, pwm_total, pwm_step, pwm_count);
    set_pwm(pwm_total, pwm_duty);
    if (pwm_step < 100) {
        pwm_count++;
        if (pwm_count >= 20) {
            pwm_count = 1;
            pwm_step *= 5;
        }
    }
}

int
main(int argc, char **argv) {
    int i;

    static struct option longopts[] = {
        { "help",           no_argument,            NULL,           'h' },
        { "rate",           required_argument,      NULL,           'r' },
        { "trig-dir",       required_argument,      NULL,           'd' },
        { "trig-src",       required_argument,      NULL,           's' },
        { "trig-level",     required_argument,      NULL,           'l' },
        { NULL,             0,                      NULL,           0 }
    };

    while ((i = getopt_long(argc, argv, "hr:d:s:l:", longopts, NULL)) != -1) {
        switch (i) {
            case 'h': help(argv[0]); return 0;
            case 'r': sample_rate = strtol(optarg, NULL, 0); break;
            case 'd': trig_dir = strtol(optarg, NULL, 0); break;
            case 's': trig_source = strtol(optarg, NULL, 0); break;
            case 'l': trig_level = strtol(optarg, NULL, 0); break;
            default: printf("Unknown option '%c'\n", i); return 1;
        }
    }
    argc -= optind;
    argv += optind;

    SDL_Init(SDL_INIT_VIDEO);
    user_event_type_base = SDL_RegisterEvents(1);
    SDL_Window *window = SDL_CreateWindow("STM32 Scope", SDL_WINDOWPOS_UNDEFINED, SDL_WINDOWPOS_UNDEFINED, WINDOW_WIDTH, WINDOW_HEIGHT, 0);
    renderer = SDL_CreateRenderer(window, -1, SDL_RENDERER_ACCELERATED);
    SDL_RenderClear(renderer);

    init_ui();
    init_screen();
    if (!init_device("/dev/ttyUSB1"))
        cmd = scope_command_t::QUIT;

    set_sample_rate(sample_rate);
    set_trig_dir(trig_direction_t::RISING);
    set_trig_source(trig_source_t::ANALOG);
    set_trig_level(0x80);

    redraw_time_scale();
    //redraw_voltage_scale(voltages[voltage_ref]);
    redraw_trig_marker();

    while (cmd != scope_command_t::QUIT) {
        SDL_Event e;
        if (!SDL_WaitEvent(&e))
            continue;
        if (e.type == SDL_QUIT)
            break;

        switch (e.type) {
            case SDL_USEREVENT:
            switch (e.user.code) {
                case UEVENT_DATA_READY:
                redraw_screen();
                break;
            }
            break;

            case SDL_KEYDOWN:
            switch (e.key.keysym.sym) {
                case SDLK_ESCAPE:
                cmd = scope_command_t::QUIT;
                break;

                case SDLK_LEFT:
                switch (sample_rate) {
                    case 1: set_sample_rate(0); break;
                    case 3: set_sample_rate(1); break;
                }
                redraw_time_scale();
                break;

                case SDLK_RIGHT:
                switch (sample_rate) {
                    case 0: set_sample_rate(1); break;
                    case 1: set_sample_rate(3); break;
                }
                redraw_time_scale();
                break;

                case SDLK_UP:
                if (trig_level < 0xff) {
                    ++trig_level;
                    set_trig_level(trig_level);
                    redraw_trig_marker();
                }
                break;

                case SDLK_DOWN:
                if (trig_level > 0) {
                    --trig_level;
                    set_trig_level(trig_level);
                    redraw_trig_marker();
                }
                break;

                case SDLK_s:
                switch (trig_source) {
                    case trig_source_t::ANALOG:  set_trig_source(trig_source_t::DIGITAL); break;
                    case trig_source_t::DIGITAL: set_trig_source(trig_source_t::ANALOG);  break;
                }
                redraw_trig_marker();
                break;

                case SDLK_t:
                switch (trig_dir) {
                    case trig_direction_t::NONE:    set_trig_dir(trig_direction_t::RISING);  break;
                    case trig_direction_t::RISING:  set_trig_dir(trig_direction_t::FALLING); break;
                    case trig_direction_t::FALLING: set_trig_dir(trig_direction_t::NONE);    break;
                }
                redraw_trig_marker();
                break;

                case SDLK_PAGEUP:
                if (e.key.keysym.mod & KMOD_SHIFT) {
                    if (pwm_total < (65535 - pwm_step)) {
                        pwm_total += pwm_step;
                        commit_pwm();
                    }
                }
                else {
                    if (pwm_duty < (pwm_total - pwm_step)) {
                        pwm_duty += pwm_step;
                        commit_pwm();
                    }
                }
                break;

                case SDLK_PAGEDOWN:
                if (e.key.keysym.mod & KMOD_SHIFT) {
                    if (pwm_total > (pwm_duty + pwm_step)) {
                        pwm_total -= pwm_step;
                        commit_pwm();
                    }
                }
                else {
                    if (pwm_duty > pwm_step) {
                        pwm_duty -= pwm_step;
                        commit_pwm();
                    }
                }
                break;

                case SDLK_1:
                send_custom_event(1);
                break;

                case SDLK_2:
                send_custom_event(2);
                break;

                case SDLK_3:
                send_custom_event(3);
                break;

                case SDLK_4:
                send_custom_event(4);
                break;

            }
            break;

            case SDL_KEYUP:
            if (pwm_count > 0) {
                pwm_step = 1;
                pwm_count = 0;
            }
            break;
        }
    }
    shutdown_device();
    shutdown_screen();
    shutdown_ui();
    printf("bye\n");

    SDL_RenderClear(renderer);
    SDL_DestroyRenderer(renderer);
    SDL_DestroyWindow(window);
    SDL_Quit();
    return 0;
}
