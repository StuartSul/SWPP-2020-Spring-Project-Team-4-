#include <inttypes.h>
#include <stdio.h>
#include <stdlib.h>

uint64_t read();
void write(uint64_t val);

void print_bit(uint64_t x)
{
  for (int i = 63; i >= 0; --i)
    write((x >> i) & 1);
  write('\n');
}

int main()
{
  uint64_t x = read();
  print_bit(x);
  return 0;
}