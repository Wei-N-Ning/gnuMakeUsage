all: foo.o bar.o

foo.o: foo.c
	printf $(@)
	rm foo.c

bar.o: bar.c
	printf $(@)
	rm bar.c

foo.c:
	touch foo.c

bar.c:
	touch bar.c

