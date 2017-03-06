## TheNumbers_WhatDoTheyMean?

> Download file here: [TheNumbers-WhatDoTheyMean.txt](TheNumbers-WhatDoTheyMean.txt)

#### WriteUp

Sử dụng lệnh sau để xem file dạng hex.

```
traioi$ xxd TheNumbers-WhatDoTheyMean.txt | head -1

00000000: ffd8 ffe0 0010 4a46 4946 0001 0100 0001  ......JFIF......
```

Có thể thấy, file giống như định dạng JPEG, thử đổi đuôi file thành JPEG xem.

<p align="center">
	<img src="TheNumbers-WhatDoTheyMean.png" alt="TheNumbers-WhatDoTheyMean.txt">
</p>

Hehe, flag là `jpeg_png_jpg_ico_svg_etc`