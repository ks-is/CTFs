## Master Mind 2

> I've upgraded my lock! Can you solve it? <br>
> [MasterMind2.txt](./lib/MasterMind2.txt)

#### WriteUp

Đầu tiên loại bỏ các số `2`, `4`, `3`, `8` vì 

```
|   2	|   4	|   3	|   8	| No numbers are corect
```

Dòng thứ 1,

```
|   9	|   5	|   3	|   2	| One number is correct but wrongly placed
```

Số `2` và `3` bị loại bỏ, nên vị trí của `5` và `9` là

```
Số 5: 5 x x x | x x 5 x | x x x 5
Số 9: x 9 x x | x x 9 x | x x x 9
```

Dòng thứ 2,

```
|   1	|   6	|   7	|   3 	| Two numbers are correct and correctly placed
```

Số `3` bị loại nên vị trí các số còn lại vẫn như cũ.

```
Số 1: 1 x x x
Số 6: x 6 x x
Số 7: x x 7 x
```

Dòng thứ 3,

```
|   0	|   6	|   5	|   9	| Two numbers are correct but wrongly placed
```

Không có số nào bị loại nên vị trí các số sẽ là

```
Số 0: x 0 x x | x x 0 x | x x x 0 
Số 6: 6 x x x | x x 6 x | x x x 6
Số 5: 5 x x x | x 5 x x | x x x 5
Số 9: 9 x x x | x 9 x x | x x 9 x
```

Nhưng khi so sánh với vị trí của số `5` và `9` ở dòng thứ 1, vị trí số `6` ở dòng thứ 2 thì được kết quả là

```
Số 0: x 0 x x | x x 0 x | x x x 0
Số 6: loại
Số 5: 5 x x x | x x x 5 
Số 9: x 9 x x | x x 9 x
```

Dòng cuối cùng,

```
|   5	|   2	|   4	|   0	| One number is correct and correctly placed
```

Số `2` và `4` bị loại nên vị trí các số là

```
Số 5: 5 x x x
Số 0: x x x 0
```

Khi so sánh với số `5` và `0` ở bước trên thì được

```
Số 5: 5 x x x
Số 0: x x x 0
```

Vậy còn lại các số:

```
5 x x x
1 x x x
x 9 x x | x x 9 x
x x 7 x
x x x 0
```

Thấy được ở dòng 2, số `3` và `6` bị loại nên `1` và `7` là 2 số đúng nên vị trí không đổi => số `5` bị loại.

Dòng 3, số `5` và `6` bị loại nên `0` và `9` đúng, nhưng do vị trí `x x 9 x` trùng với số `7` nên đáp án cuối cùng là `1970`