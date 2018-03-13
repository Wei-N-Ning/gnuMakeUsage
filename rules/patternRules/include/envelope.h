#ifndef ENVELOPE_H_
#define ENVELOPE_H_

struct Envelope {
    const char *address;
    int isValid;
    int isDeliverable;
} Envelope_t;

#endif
