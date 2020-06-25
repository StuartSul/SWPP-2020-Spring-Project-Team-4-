#include <inttypes.h>
#include <stdlib.h>

uint64_t read();
void write(uint64_t val);

uint64_t area(uint32_t *points, int n) {
  uint64_t total = 0;
  int64_t rem = 0;

  for (unsigned i = 0; i < n; i++) {
    unsigned j = (i + 1) % n;
    int64_t x_i = points[i * 2];
    int64_t y_i = points[i * 2 + 1];
    int64_t x_j = points[j * 2];
    int64_t y_j = points[j * 2 + 1];
    int64_t val = (x_i * y_j - y_i * x_j);
    total += val / 2;
    rem += val % 2;
  }

  total += (rem / 2);
  return total;
}

int main() {
    uint64_t n = read();
    if (n == 0) {
      write(0);
      return 0;
    }
    uint32_t *points = (uint32_t *)malloc(sizeof(int) * 2 * n);
    for (int i = 0; i < 2 * n; ++i)
        points[i] = (uint32_t)read();

    uint64_t value = area(points, n);

    write(value);

    free(points);

    return 0;
}