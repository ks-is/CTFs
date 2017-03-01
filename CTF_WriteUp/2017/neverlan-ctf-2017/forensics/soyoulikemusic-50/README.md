## SoYouLikeMusic

> [SoYouLikeMusic.class](SoYouLikeMusic.class)

#### Write-up

- Đề bài cho file: `SoYouLikeMusic.class` - đây là định dạng java bytecode [[1](https://en.wikipedia.org/wiki/Java_class_file)]. Có thể thực thi bằng câu lệnh:

```
$ java SoYouLikeMusic
```

- Chương trình chạy được, hỏi một vài câu hỏi gì đó bắt ta trả lời. Khoan hãy quan tâm đến nó, định dạng bytecode có đặc điểm là có khả năng biên dịch ngược (decompile). Theo [[2](https://en.wikipedia.org/wiki/Decompiler)]:

> The bytecode formats used by many virtual machines (such as the Java Virtual Machine or the .NET Framework Common Language Runtime) often include extensive metadata and high-level features that make **decompilation quite feasible**.

- Thử decompile bằng 1 online tool: [[3](http://www.javadecompilers.com/)], thì thấy thu được source java rất rõ ràng: [[4](SoYouLikeMusic.java)]

- File source java cho thấy chương trình sẽ hỏi 3 câu hỏi về sở thích âm nhạc của tác giả. Nếu trả lời đúng cả 3 câu hỏi, người chơi sẽ đi đến:

```java
System.out.println("Congratulations!! You did it!!");
System.out.println("ZmxhZ3tTdGlsbF9XYWl0aW5nX09uX3B1cnZlc3RhJ3NfTWl4dGFwZX0=");
```

- Chuỗi trên có cấu trúc giống với đầu ra của mã hóa base64, tiến hành giải mã thu được flag:

```
$ echo "ZmxhZ3tTdGlsbF9XYWl0aW5nX09uX3B1cnZlc3RhJ3NfTWl4dGFwZX0=" | base64 -d

flag{Still_Waiting_On_purvesta's_Mixtape}
```
