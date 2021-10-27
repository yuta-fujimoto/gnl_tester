SRCS = get_next_line.c get_next_line_utils.c gnl_tester.c
BONUS = get_next_line_bonus.c get_next_line_utils_bonus.c gnl_tester_bonus.c
SE = get_next_line.c get_next_line_utils.c gnl_tester_error_stdin.c
CFLAG = -Wall -Werror -Wextra
CC = clang

all: $(SRCS)
	$(CC) $(CFLAG) -D BUFFER_SIZE=256 $^

normal: $(SRCS)
	$(CC) $(CFLAG) -D BUFFER_SIZE=256 $^
	./a.out text/4o > 4o
	./a.out text/5o > 5o
	./a.out text/3o > 3o
	./a.out text/4m > 4m
	./a.out text/5m > 5m
	./a.out text/3m > 3m
	diff text/4o 4o
	diff text/5o 5o
	diff text/3o 3o
	diff text/3m 3m
	diff text/4m 4m
	diff text/5m 5m
	./a.out text/2000o > 2000o
	./a.out text/2001o > 2001o
	./a.out text/1999o > 1999o
	./a.out text/2000m > 2000m
	./a.out text/2001m > 2001m
	./a.out text/1999m > 1999m
	diff text/2000o 2000o
	diff text/2001o 2001o
	diff text/1999o 1999o
	diff text/2000m 2000m
	diff text/2001m 2001m
	diff text/1999m 1999m
	./a.out text/31o > 31o
	./a.out text/32o > 32o
	./a.out text/33o > 33o
	./a.out text/31m > 31m
	./a.out text/32m > 32m
	./a.out text/33m > 33m
	diff text/31o 31o
	diff text/32o 32o
	diff text/33o 33o
	diff text/31m 31m
	diff text/32m 32m
	diff text/33m 33m

4: $(SRCS)
	$(CC) $(CFLAG) -D BUFFER_SIZE=4 $^
	./a.out text/4o > 4o
	./a.out text/5o > 5o
	./a.out text/3o > 3o
	./a.out text/4m > 4m
	./a.out text/5m > 5m
	./a.out text/3m > 3m
	diff text/4o 4o
	diff text/5o 5o
	diff text/3o 3o
	diff text/3m 3m
	diff text/4m 4m
	diff text/5m 5m

32: $(SRCS)
	$(CC) $(CFLAG) -D BUFFER_SIZE=32 $^
	./a.out text/31o > 31o
	./a.out text/32o > 32o
	./a.out text/33o > 33o
	./a.out text/31m > 31m
	./a.out text/32m > 32m
	./a.out text/33m > 33m
	diff text/31o 31o
	diff text/32o 32o
	diff text/33o 33o
	diff text/31m 31m
	diff text/32m 32m
	diff text/33m 33m

2000: $(SRCS)
	$(CC) $(CFLAG) -D BUFFER_SIZE=2000 $^
	./a.out text/2000o > 2000o
	./a.out text/2001o > 2001o
	./a.out text/1999o > 1999o
	./a.out text/2000m > 2000m
	./a.out text/2001m > 2001m
	./a.out text/1999m > 1999m
	diff text/2000o 2000o
	diff text/2001o 2001o
	diff text/1999o 1999o
	diff text/2000m 2000m
	diff text/2001m 2001m
	diff text/1999m 1999m

leaks4: $(SRCS)
	$(CC) $(CFLAG) -D BUFFER_SIZE=4 $^
	./a.out text/4o > tmp
	./a.out text/5o > tmp
	./a.out text/3o > tmp
	./a.out text/4m > tmp
	./a.out text/5m > tmp
	./a.out text/3m > tmp
	./a.out text/31o > tmp
	./a.out text/32o > tmp
	./a.out text/33o > tmp
	./a.out text/31m > tmp
	./a.out text/32m > tmp
	./a.out text/33m > tmp

leaks32: $(SRCS)
	$(CC) $(CFLAG) -D BUFFER_SIZE=32 $^
	./a.out text/4o > tmp
	./a.out text/5o > tmp
	./a.out text/3o > tmp
	./a.out text/4m > tmp
	./a.out text/5m > tmp
	./a.out text/3m > tmp
	./a.out text/31o > tmp
	./a.out text/32o > tmp
	./a.out text/33o > tmp
	./a.out text/31m > tmp
	./a.out text/32m > tmp
	./a.out text/33m > tmp

leaks256: $(SRCS)
	$(CC) $(CFLAG) -D BUFFER_SIZE=256 $^
	./a.out text/4o > tmp
	./a.out text/5o > tmp
	./a.out text/3o > tmp
	./a.out text/4m > tmp
	./a.out text/5m > tmp
	./a.out text/3m > tmp
	./a.out text/31o > tmp
	./a.out text/32o > tmp
	./a.out text/33o > tmp
	./a.out text/31m > tmp
	./a.out text/32m > tmp
	./a.out text/33m > tmp

se: $(SE)
	$(CC) $(CFLAG) -D BUFFER_SIZE=256 $^
	./a.out

fclean: ./a.out
	rm $^
	rm 3o 4o 5o 31o 32o 33o 1999o 2000o 2001o 3m 4m 5m 31m 32m 33m 1999m 2000m 2001m e l leaks.log

re:
	fclean all

bonus: $(BONUS)
	$(CC) $(CFLAG) -D BUFFER_SIZE=256 $^

linux: $(SRCS)
	$(CC) $(CFLAG) -D BUFFER_SIZE=4 $^
	valgrind --leak-check=full --show-leak-kinds=all ./a.out a.txt
