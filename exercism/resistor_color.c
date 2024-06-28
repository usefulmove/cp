#include "resistor_color.h"

static const resistor_band_t resistor_colors[COLOR_COUNT] = {
  BLACK,
  BROWN,
  RED,
  ORANGE,
  YELLOW,
  GREEN,
  BLUE,
  VIOLET,
  GREY,
  WHITE
};

int color_code(resistor_band_t color) {
  if (color >= BLACK && color <= WHITE) {
    return color;
  }
  return -1;
}

const resistor_band_t* colors() {
  return resistor_colors;
}
