#include <inttypes.h>
#include <stdio.h>
#include <stdlib.h>

uint64_t read();
void write(uint64_t val);

int my_strlen(int *str) {
    for (int i = 0; i < 10000; i++) {
        if (str[i] == '\0')
            return i;
    }
    return -1;
}

int cntdiffchr(int *str) {
    int n = my_strlen(str);
    int cnt = 0;
    for (int i = 0; i < n; i++) {
        cnt++;
        for (int j = 0; j < i; j++) {
            if (str[j] == str[i]) {
                cnt--;
                break;
            }
        }
    }
    return cnt;
}

int naiveMatching(int *str, int *pattern) {
    int n = my_strlen(str);
    int m = my_strlen(pattern);
    for (int i = 0; i < n - m + 1; i++) {
        for (int j = 0; j < m; j++) {
            if (str[i + j] != pattern[j])
                break;
            if (j == m - 1)
                return i;
        }
    }
    return -1;
}

int kmpMatching(int *str, int *pattern) {
    int n = my_strlen(str);
    int m = my_strlen(pattern);

    int pi[m];
    pi[0] = -1;

    int i = 0, j = 0, k = -1;
    while (j < m) {
        if (k == -1 || pattern[j] == pattern[k]) {
            j++; k++;
            pi[j] = k;
        } else
            k = pi[k];
    }

    j = 0;
    while (i < n) {
        if (j == -1 || str[i] == pattern[j]) {
            i++; j++;
        } else
            j = pi[j];
        if (j == m)
            return i - m;
    }

    return -1;
}

int boyer_mooreMatching(int *str, int *pattern) {
    int n = my_strlen(str);
    int m = my_strlen(pattern);

    const int sz = 1000;
    int skip[sz];

    for (int i = 0; i < sz; i++)
        skip[i] = m;
    for (int i = m - 2; i >= 0; i--) {
        if (skip[pattern[i]] == m)
            skip[pattern[i]] = m - 1 - i;
    }

    for (int i = 0; i < n - m + 1; i++) {
        int j = m - 1;
        int k = i + m - 1;
        while (j >= 0 && str[k] == pattern[j]) {
            j--; k--;
        }
        if (j < 0)
            return i;
        i = i + skip[pattern[i + m - 1]];
    }

    return -1;
}

int main() {
    int str[] = {84, 104, 105, 115, 32, 105, 115, 32, 102, 111, 114, 32, 83, 87, 80, 80, 32, 83, 112, 114, 105, 110, 103, 10};
    int pattern[] = {83, 87, 80, 80};

    write(naiveMatching(str, pattern));
    write(kmpMatching(str, pattern));
    write(boyer_mooreMatching(str, pattern));

    return 0;
}