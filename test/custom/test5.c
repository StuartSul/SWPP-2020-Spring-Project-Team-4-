#include <inttypes.h>
#include <stdio.h>
#include <stdlib.h>

uint64_t read();
void write(uint64_t val);

void swap(int32_t* a, int32_t* b) 
{ 
    int32_t temp = *b;
    *b = *a;
    *a = temp;
}

int32_t partition(int32_t arr[], int32_t low, int32_t high) 
{ 
    int32_t pivot = arr[high];
    int32_t i = (low - 1);
  
    for (int32_t j = low; j <= high - 1; j++) 
    {
        if (arr[j] < pivot) 
        { 
            i++;
            swap(&arr[i], &arr[j]); 
        } 
    } 

    swap(&arr[i + 1], &arr[high]); 
    return (i + 1);
}
  

void quickSort(int32_t arr[], int32_t low, int32_t high) 
{ 
    if (low < high) 
    { 
        int32_t p = partition(arr, low, high); 
        quickSort(arr, low, p - 1); 
        quickSort(arr, p + 1, high); 
    } 
} 

void printArray(int32_t arr[], int32_t size) 
{ 
    int32_t i; 
    for (i = 0; i < size; i++) 
        write(arr[i]); // 1 2 3 4 ... 13 14 15
} 

int32_t main() 
{ 
    int32_t arr[15];
    arr[0] = 11;
    arr[1] = 10;
    arr[2] = 12;
    arr[3] = 2;
    arr[4] = 7;
    arr[5] = 3;
    arr[6] = 8;
    arr[7] = 14;
    arr[8] = 4;
    arr[9] = 9;
    arr[10] = 15;
    arr[11] = 1;
    arr[12] = 13;
    arr[13] = 6;
    arr[14] = 5;
    int32_t n = 15; 
    quickSort(arr, 0, n-1);
    printArray(arr, n); 
    return 0; 
} 