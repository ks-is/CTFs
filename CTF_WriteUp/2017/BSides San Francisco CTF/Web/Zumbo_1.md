## Zumbo 1

> Welcome to ZUMBOCOM....you can do anything at ZUMBOCOM.
> 
> Three flags await. Can you find them?
>
> http://zumbo-8ac445b1.ctf.bsidessf.net
>
> Stages 2 and 3 - coming soon!

#### WriteUp

Đầu tiên, thử `viewsource` xem thế nào. Phát hiện ở cuối source có dòng

```html
<!-- page: index.template, src: /code/server.py -->
```

Theo đường link phía trên vào `http://zumbo-8ac445b1.ctf.bsidessf.net/server.py`, và nhận được đoạn code Python [server.py](./lib/server.py).

```Python
import flask, sys, os
import requests

app = flask.Flask(__name__)
counter = 12345672


@app.route('/<path:page>')
def custom_page(page):
    if page == 'favicon.ico': return ''
    global counter
    counter += 1
    try:
        template = open(page).read()
    except Exception as e:
        template = str(e)
    template += "\n<!-- page: %s, src: %s -->\n" % (page, __file__)
    return flask.render_template_string(template, name='test', counter=counter);

@app.route('/')
def home():
    return flask.redirect('/index.template');

if __name__ == '__main__':
    flag1 = 'FLAG: FIRST_FLAG_WASNT_HARD'
    with open('/flag') as f:
            flag2 = f.read()
    flag3 = requests.get('http://vault:8080/flag').text

    print "Ready set go!"
    sys.stdout.flush()
    app.run(host="0.0.0.0")
```

Chả hiểu gì nhưng đại khái là mình đã thấy dòng flag1 = `FLAG: FIRST_FLAG_WASNT_HARD`