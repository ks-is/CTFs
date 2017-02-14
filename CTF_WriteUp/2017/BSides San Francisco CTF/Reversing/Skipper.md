## Skipper

> The given binary will give you the password... if you meet its criteria!
>
>    [skipper-32](./lib/skipper-32) <br>
>    [skipper-64](./lib/skipper-64)

#### WriteUp

Sử dụng `radare2` để phân tích hàm `main`.

```
|           0x0804a0a0      8d85f4fbffff   lea eax, [ebp - local_40ch]
|           0x0804a0a6      50             push eax
|           0x0804a0a7      681fa30408     push str.Computer_name:__s_n ; str.Computer_name:__s_n ; "Computer name: %s." @ 0x804a31f
|           0x0804a0ac      e83fe5ffff     call sym.imp.printf        ; int printf(const char *format);
|           0x0804a0b1      83c410         add esp, 0x10
|           0x0804a0b4      83ec08         sub esp, 8
|           0x0804a0b7      6832a30408     push str.hax0rz__ ; str.hax0rz__ ; "hax0rz!~" @ 0x804a332
|           0x0804a0bc      8d85f4fbffff   lea eax, [ebp - local_40ch]
|           0x0804a0c2      50             push eax
|           0x0804a0c3      e808e5ffff     call sym.imp.strcmp        ; int strcmp(const char *s1, const char *s2);
```

Đầu tiên, chương trình sẽ lấy Computer name tức là lệnh `hostname` trên máy để so sánh với chuỗi *"hax0rz!~"*

```
|           0x0804a10e      50             push eax
|           0x0804a10f      6870a30408     push str.OS_version:__s_n ; str.OS_version:__s_n ; "OS version: %s." @ 0x804a370
|           0x0804a114      e8d7e4ffff     call sym.imp.printf        ; int printf(const char *format);
|           0x0804a119      83c410         add esp, 0x10
|           0x0804a11c      83ec08         sub esp, 8
|           0x0804a11f      6880a30408     push str.2.4.31 ; str.2.4.31 ; "2.4.31" @ 0x804a380
```

Sau đó chương trình sẽ tiếp tục lấy thông tin OS version và so sánh với *"2.4.31"*

```
|           0x0804a1a1      83ec08         sub esp, 8
|           0x0804a1a4      68b9a30408     push str.AMDisbetter_ ; str.AMDisbetter_ ; "AMDisbetter!" @ 0x804a3b9
|           0x0804a1a9      8d85f4fbffff   lea eax, [ebp - local_40ch]
|           0x0804a1af      50             push eax
|           0x0804a1b0      e81be4ffff     call sym.imp.strcmp        ; int strcmp(const char *s1, const char *s2);
|           0x0804a1b5      83c410         add esp, 0x10
|           0x0804a1b8      85c0           test eax, eax
|       ,=< 0x0804a1ba      7422           je 0x804a1de
|       |   0x0804a1bc      83ec08         sub esp, 8
|       |   0x0804a1bf      8d85f4fbffff   lea eax, [ebp - local_40ch]
|       |   0x0804a1c5      50             push eax
|       |   0x0804a1c6      68c8a30408     push str.Sorry__your_CPU____s___is_not_supported__n ; str.Sorry__your_CPU____s___is_not_supported__n ; "Sorry, your CPU - %s - is not supported!." @ 0x804a3c8
```

Sau đó là lấy thông tin CPU và so sánh với *"AMDisbetter!"*.

```
|      ||   ; JMP XREF from 0x0804a1ba (main)
|      |`-> 0x0804a1de      e880e8ffff     call sub.printf_a63        ; int printf(const char *format);
|      |    ; JMP XREF from 0x0804a1dc (main)
```

Cuối cùng là in flag ra màn hình (Cái này là mình đoán).

Đối cách thông thường thì sẽ thao tác step-by-step tức là thay đổi `hostname`, OS Version, tên CPU, .. nhưng đề bài là *Skipper*, mình sẽ dùng cách ngắn gọn hơn mà không cần các thay đổi rườm rà như vậy bằng cách sử dụng debugging.

Trong phần này, mình sử dụng công cụ `GDB`. Đầu tiên, đặt breakpoint tại đầu hàm `main`.

```
(gdb)$ break *0x0804a0a0
```

Sau đó nhảy tới dòng print in ra flag

```
(gdb)$ jump *0x0804a1de
```
```
Result: FLAG:f51579e9ca38ba87d71539a9992887ff
```

Bingo!! Flag cuối cùng là: `FLAG:f51579e9ca38ba87d71539a9992887ff`
