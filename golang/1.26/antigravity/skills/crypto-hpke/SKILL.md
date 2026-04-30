# Go 1.26 Hybrid Public Key Encryption (HPKE)

Support for Hybrid Public Key Encryption (HPKE) as specified in RFC 9180.

## Purpose
- Implement secure asymmetric encryption with post-quantum hybrid KEMs.
- Encapsulate and decapsulate secrets using the `crypto/hpke` package.

## Key APIs
- `hpke.NewContextSender`: Create a sender context.
- `hpke.NewContextReceiver`: Create a receiver context.
