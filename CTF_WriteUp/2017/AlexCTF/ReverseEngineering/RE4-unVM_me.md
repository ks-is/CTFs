## RE4: unVM me

> If I tell you what version of python I used .. where is the fun in that? <br>
> File: [unvm_me.pyc](https://github.com/TraiOi/CTF_WriteUp/blob/master/2017/AlexCTF/ReverseEngineering/lib/unvm_me.pyc)

#### WriteUp

Using [uncompyle6](https://github.com/rocky/python-uncompyle6) tool to convert `.pyc` to `py`

```python
import md5
md5s = [174282896860968005525213562254350376167L, 
137092044126081477479435678296496849608L, 
126300127609096051658061491018211963916L, 
314989972419727999226545215739316729360L, 
256525866025901597224592941642385934114L, 
115141138810151571209618282728408211053L, 
8705973470942652577929336993839061582L, 
256697681645515528548061291580728800189L, 
39818552652170274340851144295913091599L, 
65313561977812018046200997898904313350L, 
230909080238053318105407334248228870753L, 
196125799557195268866757688147870815374L, 
74874145132345503095307276614727915885L]
print 'Can you turn me back to python ? ...'

flag = raw_input('well as you wish.. what is the flag: ')
if len(flag) > 69:
    print 'nice try'
    exit()
if len(flag) % 5 != 0:
    print 'nice try'
    exit()
for i in range(0, len(flag), 5):
    s = flag[i:i + 5]
    if int('0x' + md5.new(s).hexdigest(), 16) != md5s[i / 5]:
        print 'nice try'
        exit()

print 'Congratz now you have the flag'
```

Then we know the flag is split into 5 characters and convert into md5 hash. We have to brute force to get the flag.

I'm using this [Perl script](https://github.com/TraiOi/CTF_WriteUp/blob/master/2017/AlexCTF/ReverseEngineering/scripts/RE4-unVM_me.pl) to create a file `md5.hash` includes 13 md5 hashes and get result.

```
831daa3c843ba8b087c895f0ed305ce7
6722f7a07246c6af20662b855846c2c8
5f04850fec81a27ab5fc98befa4eb40c
ecf8dcac7503e63a6a3667c5fb94f610
c0fd15ae2c3931bc1e140523ae934722
569f606fd6da5d612f10cfb95c0bde6d
68cb5a1cf54c078bf0e7e89584c1a4e
c11e2cd82d1f9fbd7e4d6ee9581ff3bd
1df4c637d625313720f45706a48ff20f
3122ef3a001aaecdb8dd9d843c029e06
adb778a0f729293e7e0b19b96a4c5a61
938c747c6a051b3e163eb802a325148e
38543c5e820dd9403b57beff6020596d
```

Using [John the ripper](http://www.openwall.com/john/) to crack those md5 hashes.

Add those lines into `john.conf`

```
[Incremental:AlexCTF]
File = $JOHN/lowernum.chr
Extra = ALEXCTF{}
MinLen = 5
MaxLen = 5
CharCount = 45
```

```
$ john md5.hash --format=raw-md5 --incremental=alexctf
```

Result:

```
?:ALEXC
?:TF{dv
?:5d4s2
?:vj8nk
?:43s8d
?:8l6m1
?:ds9v4
?:1n52n
?:v37j4
?:81h3d
?:28n4b
?:6v3k}
```

Remove special characters to get flag

```
$ john md5.hash --format=raw-md5 --show | tr -d "?:\n"
```

And the flag is `ALEXCTF{dv5d4s2vj8nk43s8d8l6m1ds9v41n52nv37j481h3d28n4b6v3k}`
