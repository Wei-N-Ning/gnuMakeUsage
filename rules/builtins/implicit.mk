
# %.c: %.o rule is built-in
app: main.c model.o core.o
	gcc -o $(@) $(^)

clean:
	rm -f *.o app
