#ifndef SCREEN_H
#define SCREEN_H 1

#include <stdint.h>

#include "common.h"

void init_screen();
void add_samples(uint16_t num_samples, sample_t *samples);
void end_of_sweep();
void redraw_screen();
void shutdown_screen();

#endif // SCREEN_H
