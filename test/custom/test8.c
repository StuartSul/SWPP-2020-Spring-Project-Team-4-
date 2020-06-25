#include <inttypes.h>
#include <stdio.h>
#include <stdlib.h>

uint64_t read();
void write(uint64_t val);

int hash(int x, int n) {
    return x % n;
}

void hash_insert(int *table, int n, int x) {
    int h0 = hash(x, n);

    if (table[h0] == -1) {
        table[h0] = x;
        return;
    } else {
        int h;
        for (h = h0; table[h] != -1; h = (h*h + h + 1) % n);
        table[h] = x;
        return;
    }
}

void hash_delete(int *table, int n, int x) {
    int h0 = hash(x, n);

    if (table[h0] == x) {
        table[h0] = -1;
        return;
    } else {
        int h;
        for (h = h0; table[h] != x; h = h*h + h + 1);
        table[h] = -1;
        return;
    }
}

void print_hash_table(int *table, int n) {
    for (int i = 0; i < n; i++)
        write(table[i]);
}

int main() {
    const int n = 7;
    int hash_table[n];
    for (int i = 0; i < n; i++)
        hash_table[i] = -1;

    hash_insert(hash_table, n, 1);
    hash_insert(hash_table, n, 2);
    hash_insert(hash_table, n, 3);
    hash_insert(hash_table, n, 3);
    hash_insert(hash_table, n, 2);
    hash_insert(hash_table, n, 11);
    hash_insert(hash_table, n, 33);
    hash_delete(hash_table, n, 33);
    hash_delete(hash_table, n, 11);
    hash_delete(hash_table, n, 2);
    hash_delete(hash_table, n, 3);
    hash_delete(hash_table, n, 1);

    print_hash_table(hash_table, n);
    return 0;
}