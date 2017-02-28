def bytes2reg(m):
	L = 8
	pol = []
	dic = {'1' : 1, '0' : 0}
	for i in m:
		b = bin(ord(i)).split('b')
		b = b[1]
		b = '0'*(L - len(b)) + b
		for c in b:
			pol.append(dic[c])
	return pol


def reg2bytes(pol):
	res = ""
	if len(pol) % 8 != 0:
		pol.extend([0 for _ in range(8 - (len(pol) % 8))])
	b = [int(i) for i in pol]
	for i in range(4):
		ch = 0
		pw = 7
		for _ in range(8):
			ch += b.pop(0) * (2**pw)
			pw -= 1
		res += chr(ch)
	return res


def encrypt(m, k):
	enc = [i for i in m]
	enc.extend([0 for _ in range(32)])
	for i in range(32):
		enc[32+i] = enc[31+i] ^ enc[16+i] ^ enc[1+i] ^ enc[i] ^ k[i]
	return enc[32:]


f = open("flag.png", 'r')
file = f.read()
f.close()
enc = open("file.png", 'w')
enc.write(file[:file.find("IDAT")])

cnt = 0
while file[cnt:].find("IDAT") != -1:
	enc.write("IDAT")
	p = file[cnt:].find("IDAT") + cnt
	length = int(file[p-4:p].encode('hex'), 16)
	data = file[p+4:p+length+4]
	crc = file[p+length+4:p+length+8]
	key = bytes2reg(crc)
	l = length - (length % 4)
	for i in range(0, l, 4):
		block = data[i:i+4]
		block = bytes2reg(block)
		e = encrypt(block, key)
		enc.write(reg2bytes(e))
	enc.write(data[l:length])
	cnt = p + 4 + length + 4
	e = encrypt(key, key)
	enc.write(reg2bytes(e))
enc.write(file[cnt:])
enc.close()
