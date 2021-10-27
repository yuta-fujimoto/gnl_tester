all: gen.c
	gcc $^
	./a.out 1 31 > 31o
	./a.out 1 32 > 32o
	./a.out 1 33 > 33o
	./a.out 4 33 > 33m
	./a.out 10 32 > 32m
	./a.out 6 31 > 31m
	./a.out 1 2000 > 2000o
	./a.out 1 2001 > 2001o
	./a.out 1 1999 > 1999o
	./a.out 3 1999 > 1999m
	./a.out 2 2000 > 2000m
	./a.out 4 2001 > 2001m
	./a.out 1 4 > 4o  
	./a.out 1 3 > 3o
	./a.out 1 5 > 5o
	./a.out 20 5 > 5m
	./a.out 20 4 > 4m
	./a.out 20 3 > 3m

clean:
	rm 31o 32o 33o 33m 32m 31m 2000o 2001o 1999o 1999m 2000m 2001m 4o 3o 5o 4m 5m 3m

fclean: clean
	rm ./a.out
