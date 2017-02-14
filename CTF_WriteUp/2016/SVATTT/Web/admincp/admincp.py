import signal, os,sys

def handler(signum, frame):
    print 'Timeout'
    sys.exit(-1)

# Set the signal handler and a 5-second alarm
signal.signal(signal.SIGALRM, handler)
signal.alarm(5)

class Unbuffered(object):
   def __init__(self, stream):
       self.stream = stream
   def write(self, data):
       self.stream.write(data)
       self.stream.flush()
   def __getattr__(self, attr):
       return getattr(self.stream, attr)

sys.stdout = Unbuffered(sys.stdout)
# sys.stderr = None

buffer = raw_input()

cipher = buffer.split('GET /login/')[1]
cipher = cipher.split(' ')[0].strip()

print 'HTTP/1.1 200 OK\r\nContent-type: text/html\r\n\r\n'
print 'Your credential:',cipher


IV = "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX".decode('hex')
KEY = "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX".decode('hex')
FLAG = "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
cipher = raw_input("Enter your the credential: ")

login = json.loads(AES.new(KEY, AES.MODE_OFB, IV).decrypt(cipher.decode('hex')))

if login['user'] == 'admin':
    print 'Here is your reward:',FLAG