#ifndef SCREEN_H
#define SCREEN_H 1

#include <stdint.h>

void init_screen();
void add_analog_samples(uint16_t num_samples, uint16_t *samples);
void add_digital_samples(uint16_t num_samples, uint16_t *samples);
void end_of_sweep();
void redraw_screen();
void shutdown_screen();

#endif // SCREEN_H
