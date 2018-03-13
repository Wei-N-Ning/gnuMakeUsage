#ifndef VALIDATOR_H_
#define VALIDATOR_H_

typedef struct Envelope *pEnvelope;

void isValidAddress(pEnvelope pE);

void isDeliverable(pEnvelope pE);

#endif

