## FormatMyWorld

> \#netcat
> nc neverlanctf-challenges-elb-248020705.us-west-2.elb.amazonaws.com 6745
>
> https://en.wikipedia.org/wiki/Printf_format_string
>
> [viking@x1 formatmyworld]$ cat src/FormatMyWorld.c 
> ```c
> #include <stdio.h>
> #include <string.h>
>
>#define BUFFER 4096
>
> #define FLAG "viking didn't drop the flag this time ;)"
> 
> int main() {
> 
> char format[] = "That's cool!\nBy the way, the flag is located in memory at [%p]\n";
> char buffer[BUFFER];
>
> printf("What is your favorite color? ");
> fflush(stdout);
> scanf("%s", buffer);
> 
> printf(format, FLAG);
>
>return 0;
>}
> ```

#### WriteUp

(TODO)
