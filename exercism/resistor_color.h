#ifndef RESISTOR_COLOR_H
#define RESISTOR_COLOR_H

typedef enum {
  BLACK,
  BROWN,
  RED,
  ORANGE,
  YELLOW,
  GREEN,
  BLUE,
  VIOLET,
  GREY,
  WHITE,
  COLOR_COUNT,
} resistor_band_t;

int color_code(resistor_band_t color);
const resistor_band_t* colors();

#endif
