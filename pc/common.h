#ifndef COMMON_H
#define COMMON_H 1

#include <stdint.h> 
#include <SDL.h>

// sizes of elements:
#define ANALOG_SCREEN_WIDTH 800
#define ANALOG_SCREEN_HEIGHT 350

#define DIGITAL_SCREEN_WIDTH ANALOG_SCREEN_WIDTH
#define DIGITAL_SCREEN_HEIGHT (8 * 8)

#define TIME_SCALE_WIDTH ANALOG_SCREEN_WIDTH
#define TIME_SCALE_HEIGHT 11

#define VOLTAGE_SCALE_WIDTH 32
#define VOLTAGE_SCALE_HEIGHT ANALOG_SCREEN_HEIGHT

#define TRIG_MARKER_WIDTH 16
#define TRIG_MARKER_HEIGHT ANALOG_SCREEN_HEIGHT

#define DENSITY_WIDTH 1
#define DENSITY_HEIGHT ANALOG_SCREEN_HEIGHT

// position of elements:
// voltage scale = top left
// analog screen = right to voltage scale
// digital screen = below analog screen
// timescale = below digital screen

#define VOLTAGE_SCALE_X 0
#define VOLTAGE_SCALE_Y 0

#define TRIG_MARKER_X (VOLTAGE_SCALE_X + VOLTAGE_SCALE_WIDTH + 3)
#define TRIG_MARKER_Y VOLTAGE_SCALE_Y

#define DENSITY_X (TRIG_MARKER_X + TRIG_MARKER_WIDTH + 3)
#define DENSITY_Y TRIG_MARKER_Y

#define ANALOG_SCREEN_X (DENSITY_X + DENSITY_WIDTH + 3)
#define ANALOG_SCREEN_Y DENSITY_Y

#define TIME_SCALE_X ANALOG_SCREEN_X
#define TIME_SCALE_Y (ANALOG_SCREEN_Y + ANALOG_SCREEN_HEIGHT + 3)

#define DIGITAL_SCREEN_X ANALOG_SCREEN_X
#define DIGITAL_SCREEN_Y (TIME_SCALE_Y + TIME_SCALE_HEIGHT + 3)

#define WINDOW_WIDTH (DIGITAL_SCREEN_X + DIGITAL_SCREEN_WIDTH)
#define WINDOW_HEIGHT (DIGITAL_SCREEN_Y + DIGITAL_SCREEN_HEIGHT + 8)

extern SDL_Renderer *renderer;
extern int quit_notify_fds[2];

extern uint32_t user_event_type_base;
#define UEVENT_DATA_READY 1

struct scope_command_t {
    enum {
        QUIT                = 0,
        NORMAL              = 1,
        SEND_PWM            = 2,
        SEND_CUSTOM_EVENT   = 3,
    };
};
extern uint8_t cmd;
extern bool do_pause;

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

extern uint8_t trig_dir, trig_source, trig_level, sample_rate;
extern double raw_sampling_interval, sampling_interval;

#endif // COMMON_H

