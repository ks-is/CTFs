## Readfile

| Points |
| ------ |
| 150 |

> http://readfile.svattt.org:8888/web100.php
>
> [http://readfile.svattt.org:8888/web100.php.bak](./web100.php.bak) 

#### Solution

Open file `web100.php.bak`, we can see all sourcecode in here.

Inline `if($sig == $realsig)`, We always know there are many vulnerability about `==`, `$realsig = md5(xxx)` will return `0eXXXXXX` and always `== 0` because in PHP `0eXXXXXX` as being the scientific notation for "0 to the power of some value and that is always 0" that mean `$realsig` will return `true` if `$sig = 0`.		

So we have a payload		

```		
  ?filename=flag.php&timestamp=xxxx&sig=0		
```
We can brute-force `xxxx` with some code [payload.py](./payload.py) then get the flag		 +## Another Writeup
  		  
`SVATTT{N0_m0r3_h4sh_3xtens10n_4tt4ck}`

## Another Writeup

https://github.com/lochv/CTF/blob/master/2016/SVATTT/readfile/README.md (lochv)
