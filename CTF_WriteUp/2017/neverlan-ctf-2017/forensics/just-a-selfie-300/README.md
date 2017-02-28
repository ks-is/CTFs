## just-a-selfie

> You've been put in charge of a very secret project. There's talk that some of your data has leaked out. Your security analyst has flagged this email as "out of place". Has your company been breached?
> 
> Hmm.. Binwalk. <br>
> Now that's a useful tool! <br>
> [email.txt](./lib/email.txt)

#### WriteUp

- Đề bài cho 1 email dưới dạng source - có nghĩa là một ứng dụng đọc email sẽ đọc hiểu source này để hiển thị ra thông tin và nội dung của email. Một email có định dạng như sau: [1](https://en.wikipedia.org/wiki/Email#Message_format)

- Tóm tắt cách giải:
    + Phân tích source email
    + Trích xuất file đính kèm từ source email
    + Phân tích file đính kèm
    + Trích xuất các file chứa trong file đính kèm, thu được flag

- Phân tích nội dung source `email.txt`, đoạn sau đây cho thấy nội dung email có chứa 1 file đính kèm:
    + Filename: `selfie.jpg`
    + Được mã hóa: base64

```
--Apple-Mail=_9C94B8C8-A2CF-4892-8E1B-A89A4C3EAE03
Content-Transfer-Encoding: base64
Content-Disposition: inline;
	filename=selfie.jpg
	- Được mã hóa: base64
Content-Type: image/jpeg;
	x-unix-mode=0644;
	name="selfie.jpg"
Content-Id: <456C033A-8B84-4975-B1DC-3E5820C8993A@death.star>

(noi-dung-file-dinh-kem-da-duoc-ma-hoa-base64)

--Apple-Mail=_9C94B8C8-A2CF-4892-8E1B-A89A4C3EAE03--

--Apple-Mail=_6944D7C9-15A7-4C40-A840-349F2D525BFC--
```

- Tạo file mới: `selfie.txt`, copy + paste nội dung file đính kèm vào.

- Giải mã và ghi vào file mới dưới dạng binary:

```
$ cat selfie.txt | base64 -d > selfie.jpg
```

- Kiểm tra lại loại file:

```
$ file selfie.jpg

selfie.jpg: JPEG image data, JFIF standard 1.01, aspect ratio, density 72x72, segment length 16, Exif Standard: [TIFF image data, big-endian, direntries=2, orientation=upper-left], baseline, precision 8, 820x618, frames 3
```

Mở file `selfie.jpg` bằng ứng dụng mở hình ảnh, không thấy thông tin gì khả nghi.

- Theo hint từ đề bài, có thể cần dùng`binwalk` - một tool để xem bên trong 1 file có khả năng chứa nhiều file khác, cách dùng có thể tham khảo ở đây: [2](https://github.com/devttys0/binwalk/wiki/Quick-Start-Guide)

```
$ binwalk selfie.jpg 

DECIMAL       HEXADECIMAL     DESCRIPTION
--------------------------------------------------------------------------------
0             0x0             JPEG image data, JFIF standard 1.01
30            0x1E            TIFF image data, big-endian, offset of first image directory: 8
128969        0x1F7C9         Zip archive data, at least v2.0 to extract, name: Death_Star_Owner's_Technical_Manual_blueprints.jpg
```

Thông tin cho thấy trong file đính kèm, ngoài chứa file hình ảnh jpg, còn có 1 file zip mà bên trong file zip lại chứa 1 file hình ảnh jpg khác.

- Trích xuất các file chứa bên trong bằng `binwalk` với tùy chọn `-e` (extract):

```
$ binwalk -e selfie.jpg
```

- Mở file `Death_Star_Owner's_Technical_Manual_blueprints.jpg` sẽ thu được flag: 

`flag{rebellions_are_built_on_hope}`
