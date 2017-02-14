# TR3: CA
# What is the CA that issued Alexctf https certificate (flag is lowercase with no spaces)

import ssl
import OpenSSL
import re

host = "ctf.oddcoder.com"
port = 443

cert = ssl.get_server_certificate((host, port))
x509 = OpenSSL.crypto.load_certificate(OpenSSL.crypto.FILETYPE_PEM, cert)

# x509.get_issuer().get_components()
# > [('C', 'US'), ('O', "Let's Encrypt"), ('CN', "Let's Encrypt Authority X3")]
issuer = x509.get_issuer().get_components()[1][1]

issuer = issuer.lower()
issuer = re.sub('\s', "", issuer)

print "[+] Flag is: " + issuer