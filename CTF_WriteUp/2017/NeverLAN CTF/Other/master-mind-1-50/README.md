## Master Mind 1

> Can you break my three digit lock?<br>
> [MasterMind1.txt](MasterMind1.txt)

#### WriteUp

Đầu tiên để ý dòng 

```
|   6	|   4	|   7	| No numbers are correct
```

Ta biết được 3 số này là sai, vì vậy khi gặp 1 trong 3 số này sẽ loại trừ nó ra.

Ở dòng đầu tiên,

```
|   7	|   3	|   6	| One number is correct but wrongly placed
```

Số `7` và `6` là sai và vị trí hiện tại của số `3` là sai nên còn lại 2 vị trí.

```
3 x x | x x 3
```

Dòng thứ 2,

```
|   0	|   6	|   5	| One number is correct and correctly placed 
```

Số `6` là sai và vị trí hiện tại của số `0` và `5` là

```
Nếu 0 đúng: 0 x x 
Nếu 5 đúng: x x 5
```

Dòng thứ 3, 

```
|   3	|   7	|   2	| Two numbers are correct but wrongly placed
```

Số `7` là sai và vị trí số `3` và số `2` sai nên còn lại các vị trí:

```
Số 3: x x 3 | x 3 x
Số 2: 2 x x | x 2 x
```

Nhưng khi so sánh với vị trí đúng ở Bước 2 thì số 3 chỉ có 1 vị trí đúng là

```
Số 3: x x 3
Số 2: 2 x x | x 2 x
```

Dòng cuối cùng

```
|   5	|   2	|   4	| One number is correct and correctly placed
```

Số `4` là sai và vị trí số `5` là sai, vị trí số `2` ứng với bước trên nên đáp án cuối cùng là `0 2 3`
