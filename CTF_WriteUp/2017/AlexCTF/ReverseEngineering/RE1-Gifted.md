## RE1: Gifted

> File: [gifted](./lib/gifted)

#### WriteUp

Using tool `rabin2` from [radare2](https://github.com/radare/radare2).

`$ rabin2 -z lib/gifted`

```
vaddr=0x08048644 paddr=0x00000644 ordinal=000 sz=17 len=16 section=.rodata type=ascii string=Enter the flag: 
vaddr=0x08048658 paddr=0x00000658 ordinal=001 sz=50 len=49 section=.rodata type=ascii string=AlexCTF{Y0u_h4v3_45t0n15h1ng_futur3_1n_r3v3r5ing}
vaddr=0x0804868a paddr=0x0000068a ordinal=002 sz=23 len=22 section=.rodata type=ascii string=You got it right dude!
vaddr=0x080486a1 paddr=0x000006a1 ordinal=003 sz=12 len=11 section=.rodata type=ascii string=Try harder!
```

We get the flag:

`AlexCTF{Y0u_h4v3_45t0n15h1ng_futur3_1n_r3v3r5ing}`

