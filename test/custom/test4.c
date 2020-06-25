#include <inttypes.h>
#include <stdio.h>
#include <stdlib.h>

uint64_t read();
void write(uint64_t val);

int main()
{
    uint64_t a, b, c, d, e, f = 0;
    for (a = 0; a < 10; a++) {
        for (b = a; b < 10; b++) {
            for (c = a; c < b; c++) {
                for (d = 10000000; d < 10005000; d++) {
                    for (e = d - 100; e < d; e++) {
                        f += a + b + c + d + e;
                    }
                }
            }
        }
    }
    write(f); // 1650409323750000
    return 0;
}