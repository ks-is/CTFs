## ze

| Points |
|--------|
| 50 |

> [ze](https://github.com/TraiOi/CTF_WriteUp/blob/master/2016/SVATTT/Binary/ze/ze)

#### Solution

We get some pseudocode via IDA pro

```c
int __cdecl main(int a1, char **a2)
{
 int result;
 size_t v3;
 const char *v4;

 if (a1 <= 1)
   exit(-1);
 v3 = strlen(a2[1]);
 v4 = a2[1];
 if(strlen(v4[v3 - 1]) == 10)
   v4[v3 - 1] = 0;
 if ( strlen(v4[v3 -1]) != 8 )
   exit(-1);
 result = stroul(v4, 0, 17);
 if ( result == 53 )
   result = printf("SVATTT{%s}", v4);
 return result;
}
```

We know `strlen(v4) == 8` and `stroul(v4, 0, 17) == 53` then convert `53` from base 10 to base 17 with some code [ze.py](https://github.com/TraiOi/CTF_WriteUp/blob/master/2016/SVATTT/Binary/ze/ze.py) and get the flag


`SVATTT{00000032}`

## Another Writeup

https://github.com/khtq/xitif/blob/master/svattt2016quals.md#ze---re-50-pts (khtq)

https://github.com/k4k4/SVATTT2016/tree/master/ze (k4k4)

https://www.youtube.com/watch?v=g7dryJvjibo (Doan Khiem)
