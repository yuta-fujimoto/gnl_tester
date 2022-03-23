#include "../get_next_line.h"
#include <stdio.h>

int main()
{
	printf("error result (fd = -1): %s\n", get_next_line(-1));
	printf("error result (fd = 1000): %s\n", get_next_line(1000));
	printf("stdin result (fd = stdin): %s\n", get_next_line(0));
}
