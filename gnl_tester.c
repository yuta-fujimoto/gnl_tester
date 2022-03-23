#include "../get_next_line.h"
#include <stdio.h>
#include <fcntl.h>

int	main(int ac, char **av)
{
	int		fd;
	char	*line;

	(void)ac;
	fd = open(av[1], O_RDONLY);
	while ((line = get_next_line(fd)))
	{
		printf("%s", line);
		free(line);
	}
//	printf("%s", line);
//	free(line);
	close(fd);
	system("leaks a.out | grep 'Process ' >> leaks.log");
}
