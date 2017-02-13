# TR1: Hello there
# Why not drop us a few lines and say hi :).

import socket
import re

pattern = '.*(ALEXCTF{[A-Za-z0-9_]*}).*'

host = "chat.freenode.net"
port = 6667
nick = "TraiOi"
channel = "#alexctf"

s = socket.socket( )
s.connect((host, port))
s.send("NICK %s\r\n" % nick)
s.send("USER %s %s bla :%s\r\n" % (nick, nick, nick))
s.send("JOIN %s\r\n" % channel)

while 1:
    send = s.recv(1024)
    flag = re.match(pattern, send, re.M|re.I)
    if flag:
    	print "[+] Flag is: " + flag.group(1)
    	break