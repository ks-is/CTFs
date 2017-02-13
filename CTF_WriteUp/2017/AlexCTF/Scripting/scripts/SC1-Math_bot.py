# SC1: Math bot
# It is well known that computers can do tedious math faster than human.

from pwn import *
import re

pattern_ques = 'Question\s+([0-9]+)\s.*'
pattern_math = '([0-9]+)\s([\+\-\*\/\%])\s([0-9]+)\s.*'
pattern_flag = '.*(ALEXCTF{[A-Za-z0-9_]*}).*'

host = "195.154.53.62"
port = 1337

context(arch='i386', os='linux')

r = remote(host, port)
while 1:
	try:
		msg = r.recvline().strip()
		print msg
		matchQues = re.match(pattern_ques, msg, re.I|re.M)
		if matchQues:
			msg = r.recvline().strip()
			print msg
			matchMath = re.match(pattern_math, msg, re.I|re.M)
			
			num1 = int(matchMath.group(1))
			num2 = int(matchMath.group(3))
			sign = matchMath.group(2)

			if(sign == '+'):
				result = num1 + num2 
			elif(sign == '-'):
				result = num1 - num2
			elif(sign == '*'):
				result = num1 * num2
			elif(sign == '/'):
				result = num1 / num2
			else:
				result = num1 % num2
				
			print result
			r.send(str(result) + "\r\n")
		# Get the flag.
		matchFlag = re.match(pattern_flag, msg, re.I|re.M)
		if matchFlag:
			print "[+] Flag is: " + matchFlag.group(1)  
	except:
		break
