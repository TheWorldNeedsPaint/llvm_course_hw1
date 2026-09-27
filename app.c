#include "sim.h"

#define Y_SIZE SIM_Y_SIZE / 4
#define X_SIZE SIM_X_SIZE / 4
#define DUMPING 7

void step(int* next, int* prev) {
  for (int y = 1; y != Y_SIZE - 1; y++) {
    for (int x = 1; x != X_SIZE - 1; x++) {
      int idx = y * X_SIZE + x;
      int sum = prev[idx - 1] + prev[idx + 1] + prev[idx - X_SIZE] +
                prev[idx + X_SIZE];
      next[idx] = (sum >> 1) - next[idx];
      next[idx] -= (next[idx] >> DUMPING);
    }
  }
}

void spawnBlob(int* curr) {
  int amplitude = 1150 + simRand() % 500;
  int rand_x = simRand() % X_SIZE;
  int rand_y = simRand() % Y_SIZE;
  curr[rand_y * X_SIZE + rand_x] = amplitude;
}

int clamp(int v, int l, int h) { return v < l ? l : (v > h ? h : v); }

void render(int* buf) {
  for (int y = 0; y != Y_SIZE; y++) {
    for (int x = 0; x != X_SIZE; x++) {
      int h = buf[y * X_SIZE + x];
      int abs = h < 0 ? -h : h;
      int s = clamp(h >> 2, 0, 255);
      int argb = (0xFF << 24) | (s << 16) | (s << 8) | s;
      for (int dy = 0; dy != 4; dy++) {
        for (int dx = 0; dx != 4; dx++) {
          simPutPixel(x * 4 + dx, y * 4 + dy, argb);
        }
      }
    }
  }
}

void app() {
  int field1[X_SIZE * Y_SIZE] = {};
  int field2[X_SIZE * Y_SIZE] = {};
  int* curr = field1;
  int* prev = field2;

  while (1) {
    spawnBlob(prev);

    step(curr, prev);
    render(curr);
    simFlush();

    int* tmp = curr;
    curr = prev;
    prev = tmp;
  }
}
