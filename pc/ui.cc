#include "common.h"
#include "ui.h"
#include "font.h"

#include <stdint.h>
#include <SDL.h>

uint32_t time_scale[TIME_SCALE_HEIGHT * TIME_SCALE_WIDTH];
SDL_Texture *txt_time_scale;
SDL_Rect dst_time_scale{TIME_SCALE_X, TIME_SCALE_Y, TIME_SCALE_WIDTH, TIME_SCALE_HEIGHT};

uint32_t voltage_scale[VOLTAGE_SCALE_HEIGHT * VOLTAGE_SCALE_WIDTH];
SDL_Texture *txt_voltage_scale;
SDL_Rect dst_voltage_scale{VOLTAGE_SCALE_X, VOLTAGE_SCALE_Y, VOLTAGE_SCALE_WIDTH, VOLTAGE_SCALE_HEIGHT};

uint32_t trig_marker[TRIG_MARKER_HEIGHT * TRIG_MARKER_WIDTH];
SDL_Texture *txt_trig_marker;
SDL_Rect dst_trig_marker{TRIG_MARKER_X, TRIG_MARKER_Y, TRIG_MARKER_WIDTH, TRIG_MARKER_HEIGHT};

void
putchar(uint32_t *pixbuf, int stride, int x, int y, char c, int colour) {
    for (int j = 0; j < 11; ++j) {
        uint8_t p = bmpfont[11 * c + 10 - j];
        for (int i = 0; i < 8; ++i) {
            if (p & (0x80 >> i))
                pixbuf[stride * (y-j) + x + i] = colour;
        }
    }
}

void
putstr(uint32_t *pixbuf, int stride, int x, int y, const char *s, int colour) {
    for (; *s; s++) {
        putchar(pixbuf, stride, x, y, *s, colour);
        x += 8;
    }
}

void
format_with_suffix(char *buf, int bufsize, float x) {
    char suffix = ' ';

    if (x < 1e-12) {
        x = 0;
    }
    else if (x < 1e-9) {
        x *= 1e12;
        suffix = 'p';
    }
    else if (x < 1e-6) {
        x *= 1e9;
        suffix = 'n';
    }
    else if (x < 1e-3) {
        x *= 1e6;
        suffix = 'u';
    }
    else if (x < 1) {
        x *= 1e3;
        suffix = 'm';
    }
    else if (x < 1000) {
    }
    else if (x < 1e6) {
        x *= 1e-3;
        suffix = 'k';
    }
    else if (x < 1e9) {
        x *= 1e-6;
        suffix = 'M';
    }
    else if (x < 1e12) {
        x *= 1e-9;
        suffix = 'G';
    }
    else if (x < 1e15) {
        x *= 1e-12;
        suffix = 'T';
    }
    else {
        x = 0;
        suffix = '?';
    }

    // round x to one decimal
    int n10 = (int)(x * 10 + 0.5);

    if (n10 % 10)  
        snprintf(buf, bufsize, "%.1f%c", 0.1 * n10, suffix);
    else
        snprintf(buf, bufsize, "%d%c", n10 / 10, suffix);
}

void
init_ui() {
    txt_time_scale = SDL_CreateTexture(renderer, SDL_PIXELFORMAT_ARGB8888, SDL_TEXTUREACCESS_STREAMING, TIME_SCALE_WIDTH, TIME_SCALE_HEIGHT); // 0xrrggbb
    txt_voltage_scale = SDL_CreateTexture(renderer, SDL_PIXELFORMAT_ARGB8888, SDL_TEXTUREACCESS_STREAMING, VOLTAGE_SCALE_WIDTH, VOLTAGE_SCALE_HEIGHT); // 0xrrggbb
    txt_trig_marker = SDL_CreateTexture(renderer, SDL_PIXELFORMAT_ARGB8888, SDL_TEXTUREACCESS_STREAMING, TRIG_MARKER_WIDTH, TRIG_MARKER_HEIGHT); // 0xrrggbb
}

void
redraw_time_scale(void) {
    char buf[32];
    
    memset(time_scale, 0, sizeof(time_scale));
    for (int i = 0; i < TIME_SCALE_WIDTH; i += 100) {
        format_with_suffix(buf, sizeof(buf), sampling_interval * i);
        int x = i ? (i - 1*8) : 0;
        putstr(time_scale, TIME_SCALE_WIDTH, x, 10, buf, 0x0000ff);
    }
    SDL_UpdateTexture(txt_time_scale, nullptr, &time_scale, 4*TIME_SCALE_WIDTH);
    SDL_RenderCopy(renderer, txt_time_scale, nullptr, &dst_time_scale);
    SDL_RenderPresent(renderer);
}

void
redraw_voltage_scale(int mV) {
    char buf[32];

    printf("unit = %d mV\n", mV);
    memset(voltage_scale, 0, sizeof(voltage_scale));
    for (int i = 50; i < (VOLTAGE_SCALE_HEIGHT - 22); i += 50) {
        format_with_suffix(buf, sizeof(buf), mV * 1e-3 * i);
        //printf("voltage label for %d is %f\n", i,  mV * 1e-3 * i);
        putstr(voltage_scale, VOLTAGE_SCALE_WIDTH, 0, VOLTAGE_SCALE_HEIGHT - i + 4, buf, 0x0000ff);
    }
    SDL_UpdateTexture(txt_voltage_scale, nullptr, &voltage_scale, 4*VOLTAGE_SCALE_WIDTH);
    SDL_RenderCopy(renderer, txt_voltage_scale, nullptr, &dst_voltage_scale);
    SDL_RenderPresent(renderer);
}

void
redraw_trig_marker(void) {
    memset(trig_marker, 0, sizeof(trig_marker));
    char csrc, cdir;

    switch (trig_source) {
        case trig_source_t::NONE:
        csrc = ' ';
        break;

        case trig_source_t::ANALOG:
        csrc = 'A';
        break;

        case trig_source_t::DIGITAL:
        csrc = 'D';
        break;
    }
    switch (trig_dir) {
        case trig_direction_t::NONE:
        cdir = '-';
        break;

        case trig_direction_t::RISING:
        cdir = '/';
        break;

        case trig_direction_t::FALLING:
        cdir = '\\';
        break;
    }

    uint16_t y = ((uint16_t)trig_level * 330) >> 8;
    if (y < 4)
        y = 4;
    if (y > TRIG_MARKER_HEIGHT - 4)
        y = TRIG_MARKER_HEIGHT - 4;
    
    putchar(trig_marker, TRIG_MARKER_WIDTH, 0, TRIG_MARKER_HEIGHT - y + 4, csrc, 0xffffff);
    putchar(trig_marker, TRIG_MARKER_WIDTH, 8, TRIG_MARKER_HEIGHT - y + 4, cdir, 0xffffff);
    SDL_UpdateTexture(txt_trig_marker, nullptr, &trig_marker, 4*TRIG_MARKER_WIDTH);
    SDL_RenderCopy(renderer, txt_trig_marker, nullptr, &dst_trig_marker);
    SDL_RenderPresent(renderer);
}

void
shutdown_ui() {
    SDL_DestroyTexture(txt_trig_marker);
    SDL_DestroyTexture(txt_voltage_scale);
    SDL_DestroyTexture(txt_time_scale);
}
