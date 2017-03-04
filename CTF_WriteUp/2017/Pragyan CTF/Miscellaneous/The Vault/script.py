import re

f = open('file', 'rb')
text = f.read()
pattern = '[!@#a-z$%^A-Z &*0-9][1,3]'

matchObj = re.match(pattern, text, re.I|re.M)

if matchObj:
	print matchObj.group()
else:
	print "[-] Nothing!"