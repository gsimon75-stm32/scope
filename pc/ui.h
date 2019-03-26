#ifndef UI_H
#define UI_H 1

#include <stdint.h>
#include <SDL.h>

void init_ui();
void redraw_time_scale(void);
void redraw_voltage_scale(void);
void redraw_trig_marker(void);
void shutdown_ui();

#endif // UI_H
