#include <inttypes.h>
#include <stdio.h>
#include <stdlib.h>

uint64_t read();
void write(uint64_t val);

void swap(int *arr, int i, int j) {
    int temp = arr[i];
    arr[i] = arr[j];
    arr[j] = temp;
}

int partition(int *arr, int n, int target) {
    int i;
    for (int index = 0; index < n; index++) {
        if (arr[index] == target) {
            i = index;
            break;
        }
    }
    swap(arr, 0, i);

    int swap_point = 0;
    for (int index = 1; index < n; index++) {
        if (arr[index] < arr[0])
            swap(arr, index, ++swap_point);
    }
    swap(arr, 0, swap_point);
    return swap_point;
}

int linearSelection(int *arr, int n, int i) {
    if (n <= 5) {
        int temp[n];
        for (int index = 0; index < n; index++)
            temp[index] = arr[index];
        for (int index1 = 1; index1 < n; index1++) {
            for (int index2 = index1; index2 > 0; index2--) {
                if (temp[index2] < temp[index2 - 1])
                    swap(temp, index2, index2 - 1);
            }
        }
        return temp[i - 1];
    }

    int num_groups = (n + 4) / 5;
    int median[num_groups];
    for (int group = 0; group < num_groups; group++) {
        int size = (group == num_groups - 1 && n % 5 != 0) ? n % 5 : 5;
        median[group] = linearSelection(arr + (group * 5), size, (size + 1) / 2);
    }

    int total_median = linearSelection(median, num_groups, (num_groups + 1) / 2);
    int p = partition(arr, n, total_median);

    if (p == i - 1)
        return arr[p];
    else if (p > i - 1)
        return linearSelection(arr, p, i);
    else
        return linearSelection(arr + (p + 1), n - p - 1, i - p - 1);

    return 0;
}

int main()
{
    int i = 10;
    int n = 20;
	int arr[20] = {10, 9, 8, 7, 6, 5, 4, 3, 2, 1, 0, -1, -2, -3, -4, -5, -6, -7, -8, -9};

    write(linearSelection(arr, n, i));

	return 0;
}