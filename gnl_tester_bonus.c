
#include "get_next_line_bonus.h"
#include <stdio.h>
#include <fcntl.h>
#define MAX_FD 256

int	main(int ac, char **av)
{
	int fd[MAX_FD];
	int i;
	int j;
	char *tmp;

	i = 1;
	printf("intput file name like a b c\n");
	while (i < ac)
	{
		fd[i] = open(av[i], O_RDONLY);
		i++;
	}
	i = 1;
	while (1)
	{
		while (i < ac)
		{
			printf("   %d:%s  ", i, av[i]);
			i++;
		}
		printf("\n");
		scanf("%d", &j);
		if (j <= 0 || j >= ac)
			break;
		printf("fd: %d\n content: %s\n\n", fd[j], get_next_line(fd[j]));
	}
	i = 1;
	while (i < ac)
		close(fd[i++]);
	system("leaks a.out");
}
