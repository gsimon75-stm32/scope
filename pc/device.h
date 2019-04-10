#ifndef DEVICE_H
#define DEVICE_H 1

#include <stdint.h>
#include "common.h"

bool init_device(const char *devname);
void set_sample_rate(uint8_t n);
void set_trig_level(uint8_t n);
void set_trig_dir(uint8_t n);
void set_trig_source(uint8_t n);
void set_pwm(uint16_t total, uint16_t duty);
void send_custom_event(uint8_t n);
void resume(void);
void shutdown_device();

#endif // DEVICE_H

