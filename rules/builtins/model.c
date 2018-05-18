#include <string.h>
#include <stdlib.h>

extern void push(const char *str, int v);

void loglength(const char *text) {
    push(text, strlen(text));
}

