#include "core.h"
#include <string.h>
static Stack *s;
void loglength(const char *text) {
    push(s, strlen(text));
    pop(s);
}

