foo.o: a.c b.c
	echo $(?)
	rm -f $(?)

a.c:
	touch a.c

b.c:
	touch b.c
	
