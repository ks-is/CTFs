#!/usr/bin/env python3
# N.B. this should only run on python 3.5 and later
from myhashfunc import transform


if __name__ == '__main__':
    s = '''The algorithm takes as input a message of arbitrary length and produces as output a 128-bit "fingerprint"
    or "message digest" of the input. It is conjectured that it is computationally infeasible to produce two messages
    having the same message digest, or to produce any message having a given prespecified target message digest.'''
    hash = transform(s.encode())
    print('VolgaCTF{{{0}}}'.format(hash.hex().upper()))
