#include <stdio.h>
#include <unistd.h>
#include <stdlib.h>
#include <time.h>

int main(int argc, char **argv)
{
	int		v = atoi(argv[1]);
	int		h = atoi(argv[2]);
	char	c;

	if (argc != 3)
	{
		write(2, "just 4 arguments are needed\n", 24);
		return (0);
	}
	if (v < 0 || h < 0)
	{
		write(2, "arguments are incorrect\n", 25);
		return (0);
	}
	for (int i = 0; i < v; i++)
	{
		for (int j = 0; j < h; j++)
		{
			srand((unsigned)time(NULL) + j + i);
			c = rand() % 94 + 32;
			printf("%c", c);
		}
		printf("\n");
	}
}
