#include "common.h"
#include "screen.h"
#include "device.h"
#include "font.h"

#include <stdio.h>
#include <stdint.h>
#include <string.h>
#include <unistd.h>
#include <sys/time.h>
#include <SDL.h>

#define NUM_BEAMS   2

int x = 0;
uint32_t analog_screen[ANALOG_SCREEN_HEIGHT*ANALOG_SCREEN_WIDTH];
SDL_Texture *txt_analog_screen;
SDL_Rect dst_analog_screen { ANALOG_SCREEN_X, ANALOG_SCREEN_Y, ANALOG_SCREEN_WIDTH, ANALOG_SCREEN_HEIGHT };
uint32_t* lastOfs[NUM_BEAMS][ANALOG_SCREEN_WIDTH];

uint32_t density[DENSITY_HEIGHT], count_density[DENSITY_HEIGHT];
SDL_Texture *txt_density;
SDL_Rect dst_density { DENSITY_X, DENSITY_Y, DENSITY_WIDTH, DENSITY_HEIGHT };

uint32_t digital_screen[DIGITAL_SCREEN_HEIGHT*DIGITAL_SCREEN_WIDTH];
SDL_Texture *txt_digital_screen;
SDL_Rect dst_digital_screen { DIGITAL_SCREEN_X, DIGITAL_SCREEN_Y, DIGITAL_SCREEN_WIDTH, DIGITAL_SCREEN_HEIGHT };

void
request_redraw() {
    SDL_Event event;
    SDL_zero(event);
    event.type = user_event_type_base;
    event.user.code = UEVENT_DATA_READY;
    event.user.data1 = nullptr;
    event.user.data2 = nullptr;
    SDL_PushEvent(&event);
}

void
end_of_sweep() {
    if (x != 0) {
        request_redraw();
        x = 0;
    }
}

void
draw_beam(int beam, int x, uint32_t sample) {
    uint16_t y = (sample * 330) >> 12;
    if (y >= ANALOG_SCREEN_HEIGHT)
        y = ANALOG_SCREEN_HEIGHT - 1;

    ++count_density[y];
    if (count_density[y] == 0xff) {
        for (int i = 0; i < DENSITY_HEIGHT; ++i)
            density[DENSITY_HEIGHT - i] = count_density[i] * 0x010101;
        memset(count_density, 0, sizeof(count_density));
    }

    reinterpret_cast<uint8_t*>(lastOfs[beam][x])[0] = 0;
    reinterpret_cast<uint8_t*>(lastOfs[beam][x])[1] = 0;
    lastOfs[beam][x] = &analog_screen[(ANALOG_SCREEN_WIDTH * (unsigned int)(ANALOG_SCREEN_HEIGHT - 1 - y)) + x];
    switch (beam) {
        case 0:
        reinterpret_cast<uint8_t*>(lastOfs[beam][x])[0] = 0x7f;
        reinterpret_cast<uint8_t*>(lastOfs[beam][x])[1] = 0xff;
        break;

        case 1:
        reinterpret_cast<uint8_t*>(lastOfs[beam][x])[0] = 0xff;
        reinterpret_cast<uint8_t*>(lastOfs[beam][x])[1] = 0x7f;
        break;
    }
}

void
add_samples(uint16_t num_samples, sample_t *samples) {
    int max_x;

    // update analog display
    max_x = num_samples;
    if (max_x > ANALOG_SCREEN_WIDTH)
        max_x = ANALOG_SCREEN_WIDTH;

    for (int x = 0; x < max_x; ++x) {
        for (int beam = 0; beam < NUM_BEAMS; ++beam) {
            draw_beam(beam, x, samples[x].analog[beam]);
        }
    }

    // update digital display
    max_x = num_samples;
    if (max_x > DIGITAL_SCREEN_WIDTH)
        max_x = DIGITAL_SCREEN_WIDTH;

    int y = 0;
    for (int mask = 0x80; mask; mask >>= 1) {

        bool was_high = (samples[0].digital & mask) != 0;
        for (int x = 0; x < max_x; ++x) {
            for (int i = 0; i < 5; ++i)
                digital_screen[DIGITAL_SCREEN_WIDTH*(y + i) + x] &= 0x0000ff;

            bool is_high = (samples[x].digital & mask) != 0;

            if (is_high && was_high) {
                digital_screen[DIGITAL_SCREEN_WIDTH*(y + 0) + x] |= 0xff0000;
            }
            else if (!is_high && !was_high) {
                digital_screen[DIGITAL_SCREEN_WIDTH*(y + 4) + x] |= 0x00ff00;
            }
            else {
                for (int i = 0; i < 5; ++i)
                    digital_screen[DIGITAL_SCREEN_WIDTH*(y + i) + x] |= 0xffff00;
            }
            was_high = is_high;
        }

        y += 8;
    }

    request_redraw();
}

int
dash_width(int i) {
    if ((i % 10) == 0)
        return 5;
    if ((i % 5) == 0)
        return 3;
    return 1;
}

void
draw_grid(void) {
    // draw grid
    for (int i = 0; i < ANALOG_SCREEN_WIDTH; i += 10) {
        int fill = dash_width(i / 10);
        for (int j = 0; j < ANALOG_SCREEN_HEIGHT; j += 10)
            for (int k = -fill; k <= fill; ++k) {
                int y = j + k;
                if ((0 <= y) && (y < ANALOG_SCREEN_HEIGHT))
                    analog_screen[ANALOG_SCREEN_WIDTH*(ANALOG_SCREEN_HEIGHT-1-y) + i] = 0x7f0000;
            }
        for (int j = 0; j < DIGITAL_SCREEN_HEIGHT; j += 2)
            digital_screen[DIGITAL_SCREEN_WIDTH*(DIGITAL_SCREEN_HEIGHT-1-j) + i] = 0x00007f;
    }
    for (int j = 0; j < ANALOG_SCREEN_HEIGHT; j += 10) {
        int fill = dash_width(j / 10);
        for (int i = 0; i < ANALOG_SCREEN_WIDTH; i += 10)
            for (int k = -fill; k <= fill; ++k) {
                int x = i + k;
                if ((0 <= x) && (x < ANALOG_SCREEN_WIDTH))
                    analog_screen[ANALOG_SCREEN_WIDTH*(ANALOG_SCREEN_HEIGHT-1-j) + i+k] = 0x7f0000;
            }
    }
}

void
init_screen() {
    for (int i = 0; i < ANALOG_SCREEN_WIDTH; ++i) {
        lastOfs[0][i] = &analog_screen[0];
        lastOfs[1][i] = &analog_screen[0];
    }

    memset(density, 0, sizeof(density));

    txt_analog_screen = SDL_CreateTexture(renderer, SDL_PIXELFORMAT_ARGB8888, SDL_TEXTUREACCESS_STREAMING, ANALOG_SCREEN_WIDTH, ANALOG_SCREEN_HEIGHT); // 0xrrggbb
    txt_digital_screen = SDL_CreateTexture(renderer, SDL_PIXELFORMAT_ARGB8888, SDL_TEXTUREACCESS_STREAMING, DIGITAL_SCREEN_WIDTH, DIGITAL_SCREEN_HEIGHT); // 0xrrggbb
    txt_density = SDL_CreateTexture(renderer, SDL_PIXELFORMAT_ARGB8888, SDL_TEXTUREACCESS_STREAMING, DENSITY_WIDTH, DENSITY_HEIGHT); // 0xrrggbb

    draw_grid();
    redraw_screen();
}

void
redraw_screen() {
    SDL_UpdateTexture(txt_analog_screen, nullptr, &analog_screen, 4*ANALOG_SCREEN_WIDTH);
    SDL_RenderCopy(renderer, txt_analog_screen, nullptr, &dst_analog_screen);
    SDL_UpdateTexture(txt_digital_screen, nullptr, &digital_screen, 4*DIGITAL_SCREEN_WIDTH);
    SDL_RenderCopy(renderer, txt_digital_screen, nullptr, &dst_digital_screen);
    SDL_UpdateTexture(txt_density, nullptr, &density, 4*DENSITY_WIDTH);
    SDL_RenderCopy(renderer, txt_density, nullptr, &dst_density);
    SDL_RenderPresent(renderer);
}

void
shutdown_screen() {
    SDL_DestroyTexture(txt_analog_screen);
    SDL_DestroyTexture(txt_digital_screen);
    SDL_DestroyTexture(txt_density);
}
