#include <inttypes.h>
#include <stdio.h>
#include <stdlib.h>

uint64_t read();
void write(uint64_t val);

void convolution(const int64_t M, const int64_t N, const int64_t *input, int64_t *output, const int64_t filter[3][3])
{
	for(int64_t i = 0 ; i < M ; i++)
	{
		for(int64_t j = 0 ; j < N ; j++)
		{
			//For each pixel
			for(int64_t x = 0 ; x < 3 ; x++)
			{
				for(int64_t y = 0 ; y < 3 ; y++)
				{
					//Boundary check
					if(i + x - 1 < 0)
						continue;
					if(i + x - 1 >= M)
						continue;
					if(j + y - 1 < 0)
						continue;
					if(j + y - 1 >= N)
						continue;

					output[i * N + j] += input[(i + x - 1) * N + (j + y - 1)] * filter[x][y];
				}
			}
		}
	}
}

int main()
{
	int64_t filter[3][3] = {{0, -1, 2},
				        {-1, 1, 2},
				        {1, 0, 0}};

	int64_t M = read(); // in: 4
    int64_t N = read(); // in: 1 2 3 4 5 6 7 8 9 ... 16
	
	int64_t *conv_input = (int64_t*)malloc(sizeof(int64_t) * M * N);
	int64_t *conv_output = (int64_t*)malloc(sizeof(int64_t) * M * N);

	for(int64_t i = 0 ; i < M ; i++)
	{
		for(int64_t j = 0 ; j < N ; j++)
		{
			conv_input[i * N + j] = read();
            conv_output[i * N + j] = 0;
		}
	}
    
	convolution(M, N, conv_input, conv_output, filter);

    for(int64_t i = 0 ; i < M ; i++)
	{
		for(int64_t j = 0 ; j < N ; j++)
		{
            write(conv_output[i * N + j]); // out: 5 12 15 8 20 28 32 8 36 44 48 8 52 43 46 -11
		}
	}

	return 0;
}