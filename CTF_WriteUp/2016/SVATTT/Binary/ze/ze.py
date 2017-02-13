#!/usr/bin/python

n = 53
b = []

while 1:
    c = n % 17
    n = int(n / 17)
    if(c == 10):
      c = 'A'
    elif(c == 11):
      c = 'B'
    elif(c == 12):
      c = 'C'
    elif(c == 13):
      c = 'D'
    elif(c == 14):
      c = 'E'
    elif(c == 15):
      c = 'F'
    elif(c == 16):
      c = 'G'
    b.append(str(c))
    if(n == 0):
        break;

b = b[::-1]

print "".join(b)
