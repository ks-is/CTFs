# SC1: Math bot
# It is well known that computers can do tedious math faster than human.

from pwn import *
import re
import hashlib

m = hashlib.md5()

host = "52.90.9.177"
port = 33333

context(arch='i386', os='linux')

pattern_ques = '.+unique.+'

r = remote(host, port)
while 1:
		msg = r.recvline().strip()
		print msg
		matchQues = re.match(pattern_ques, msg, re.I|re.M)
		if matchQues:
			result = m.update("VN")
			result = m.hexdigest()
			print result
			r.send(str(result) + "\r\n")
