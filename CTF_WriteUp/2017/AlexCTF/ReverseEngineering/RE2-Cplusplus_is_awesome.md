## RE2: C++ is awesome

> They say C++ is complex, prove them wrong! <br>
> File: [re2](./lib/re2)

#### WriteUp

Mở file với `radare2`.

```
|           0x00400bfc      e80ffeffff     call sym.std::__cxx11::basic_string_char_std::char_traits_char__std::allocator_char__::basic_string
|           0x00400c01      488d45df       lea rax, [rbp - local_21h]
|           0x00400c05      4889c7         mov rdi, rax
|           0x00400c08      e8f3fdffff     call sym.std::allocator_char_::_allocator
|           0x00400c0d      c745ec000000.  mov dword [rbp - local_14h], 0
|           0x00400c14      488d45b0       lea rax, [rbp - local_50h]
|           0x00400c18      4889c7         mov rdi, rax
|           0x00400c1b      e830feffff     call sym.std::__cxx11::basic_string_char_std::char_traits_char__std::allocator_char__::begin
|           0x00400c20      488945a0       mov qword [rbp - local_60h], rax
|           ; JMP XREF from 0x00400c93 (main)
|       .-> 0x00400c24      488d45b0       lea rax, [rbp - local_50h]
|       |   0x00400c28      4889c7         mov rdi, rax
|       |   0x00400c2b      e8c0fdffff     call sym.std::__cxx11::basic_string_char_std::char_traits_char__std::allocator_char__::end
|       |   0x00400c30      488945e0       mov qword [rbp - local_20h], rax
|       |   0x00400c34      488d55e0       lea rdx, [rbp - local_20h]
|       |   0x00400c38      488d45a0       lea rax, [rbp - local_60h]
|       |   0x00400c3c      4889d6         mov rsi, rdx
|       |   0x00400c3f      4889c7         mov rdi, rax
|       |   0x00400c42      e8f6000000     call fcn.00400d3d
|       |   0x00400c47      84c0           test al, al
|      ,==< 0x00400c49      744a           je 0x400c95
|      ||   0x00400c4b      488d45a0       lea rax, [rbp - local_60h]
|      ||   0x00400c4f      4889c7         mov rdi, rax
|      ||   0x00400c52      e843010000     call fcn.00400d9a
|      ||   0x00400c57      0fb610         movzx edx, byte [rax]
|      ||   0x00400c5a      488b0d3f1420.  mov rcx, qword [0x006020a0] ; [0x6020a0:8]=0x400e58 str.L3t_ME_T3ll_Y0u_S0m3th1ng_1mp0rtant_A__FL4G__W0nt_b3_3X4ctly_th4t_345y_t0_c4ptur3_H0wev3r_1T_w1ll_b3_C00l_1F_Y0u_g0t_1t ; "X.@"
|      ||   0x00400c61      8b45ec         mov eax, dword [rbp - local_14h]
|      ||   0x00400c64      4898           cdqe
|      ||   0x00400c66      8b0485c02060.  mov eax, dword [rax*4 + 0x6020c0] ; [0x6020c0:4]=36 ; "$"
|      ||   0x00400c6d      4898           cdqe
|      ||   0x00400c6f      4801c8         add rax, rcx                ; '&'
|      ||   0x00400c72      0fb600         movzx eax, byte [rax]
|      ||   0x00400c75      38c2           cmp dl, al
|      ||   0x00400c77      0f95c0         setne al
|      ||   0x00400c7a      84c0           test al, al
|     ,===< 0x00400c7c      7405           je 0x400c83
|     |||   0x00400c7e      e8d3feffff     call fcn.00400b56
|     |||   ; JMP XREF from 0x00400c7c (main)
|     `---> 0x00400c83      8345ec01       add dword [rbp - local_14h], 1
|      ||   0x00400c87      488d45a0       lea rax, [rbp - local_60h]
|      ||   0x00400c8b      4889c7         mov rdi, rax
|      ||   0x00400c8e      e8e7000000     call fcn.00400d7a
|      |`=< 0x00400c93      eb8f           jmp 0x400c24
|      |    ; JMP XREF from 0x00400c49 (main)
|      `--> 0x00400c95      e8d9feffff     call fcn.00400b73
```

Có thể thấy được là mảng các ký tự ở địa chỉ `0x6020a0` được so sánh với một mảng nào đó ở địa chỉ `0x6020c0`, nếu index bằng nhau thì sẽ trả về hàm `fcn.00400b73`. Mình sẽ sử dụng đoạn [script Perl](./scripts/RE2-Cplusplus_is_awesome.pl) sau để thử.

```perl
use strict;
use warnings;

my @buf = ( 0x24,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x05,0x00,0x00,
0x00,0x36,0x00,0x00,0x00,0x65,0x00,0x00,0x00,0x07,0x00,
0x00,0x00,0x27,0x00,0x00,0x00,0x26,0x00,0x00,0x00,0x2d,
0x00,0x00,0x00,0x01,0x00,0x00,0x00,0x03,0x00,0x00,0x00,
0x00,0x00,0x00,0x00,0x0d,0x00,0x00,0x00,0x56,0x00,0x00,
0x00,0x01,0x00,0x00,0x00,0x03,0x00,0x00,0x00,0x65,0x00,
0x00,0x00,0x03,0x00,0x00,0x00,0x2d,0x00,0x00,0x00,0x16,
0x00,0x00,0x00,0x02,0x00,0x00,0x00,0x15,0x00,0x00,0x00,
0x03,0x00,0x00,0x00,0x65,0x00,0x00,0x00,0x00,0x00,0x00,
0x00,0x29,0x00,0x00,0x00,0x44,0x00,0x00,0x00,0x44,0x00,
0x00,0x00,0x01,0x00,0x00,0x00,0x44,0x00,0x00,0x00,0x2b,
0x00,0x00,0x00 );
my $string = "L3t_ME_T3ll_Y0u_S0m3th1ng_1mp0rtant_A_{FL4G}_W0nt_b3_3X4ctly_th4t_345y_t0_c4ptur3_H0wev3r_1T_w1ll_b3_C00l_1F_Y0u_g0t_1t";
my $flag = "";

for(my $i=0; $i<scalar(@buf); $i+=4) {
	$flag .= substr($string, $buf[$i], 1);
}
print $flag;
```

Và flag là `ALEXCTF{W3_L0v3_C_W1th_CL45535}`
