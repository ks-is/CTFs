## Mics

> Inject me if you can! <br>
> Use netcat to use our service. <br>
> `nc 103.237.98.32 3737` <br>
> Submit WhiteHat{sha1(flag)}
> 
> Input filtered. <br>
> ```python
> def addslashes(s):
>     d = {'"': '\\"', "'": "\\'", "\0": "\\\0", "\\": "\\\\"}
>    return ''.join(d.get(c, c) for c in s)
> ```


#### WriteUp

(TODO)