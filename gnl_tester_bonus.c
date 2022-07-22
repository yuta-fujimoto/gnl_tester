
#include "../get_next_line_bonus.h"
#include <stdio.h>
#include <fcntl.h>
#define MAX_FD 256

int	main(int ac, char **av)
{
	int fd[MAX_FD];
	int i;
	int j;
	char *rlt;

	i = 1;
	if (ac != 3)
	{
		printf("usage: ./a.out file1 file2 ,,,");
		return (0);
	}
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
		rlt = get_next_line(fd[j]);
		printf("fd: %d\n content: %s\n\n", fd[j], rlt);
		free(rlt);
	}
	i = 1;
	while (i < ac)
		close(fd[i++]);
	system("leaks a.out");
}
