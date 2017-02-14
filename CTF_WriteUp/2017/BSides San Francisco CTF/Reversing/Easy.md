## Easy

> This one is easy.
> 
>    [easy-32](./lib/easy-32) <br>
>    [easy-64](./lib/easy-64) 

#### WriteUp

Đúng là easy thật .. 1 dòng lệnh duy nhất và bất ngờ xảy ra ..

```
traioi$ rabin2 -z lib/easy-32
```

```
vaddr=0x08048600 paddr=0x00000600 ordinal=000 sz=22 len=21 section=.rodata type=ascii string=What is the password?
vaddr=0x08048616 paddr=0x00000616 ordinal=001 sz=13 len=12 section=.rodata type=ascii string=the password
vaddr=0x08048624 paddr=0x00000624 ordinal=002 sz=38 len=37 section=.rodata type=ascii string=FLAG:db2f62a36a018bce28e46d976e3f9864
vaddr=0x0804864a paddr=0x0000064a ordinal=003 sz=8 len=7 section=.rodata type=ascii string=Wrong!!
```

Ô hay, cái gì kia, dễ đến tức tối >"<. Flag `FLAG:db2f62a36a018bce28e46d976e3f9864`
