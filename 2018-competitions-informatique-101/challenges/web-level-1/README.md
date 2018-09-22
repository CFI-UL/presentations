# Web challenge level 1

Do you even inspect?

http://localhost:11111/

> web

## Setup

Requirements:
- docker

Start:

```shell
docker-compose up
```

## Writeup

Open the challenge URL in your browser.

### Part 1

Inspect the page source code.

You should see hidden in HTML comment the first part of the flag.

```html
<!-- There is a lot of usefull information in source code. -->
<!-- Here is you first flag part! ;) -->
<!-- FlagPart1: FLAG-5688103 -->
```

### Part 2

Open the **console tab** in your browser developer tools, you should have some printed out.

```
Output in the console can be useful!
FlagPart2: 3be924c54b31
```

This is the second part of the flag.


### Part 3

The third part is in the HTTP header. If you open the **Network tab** in your browser developer tools you should have in the response headers.

```
HTTP/1.1 200 OK
Host: 127.0.0.1:8888
Date: Tue, 11 Sep 2018 11:52:24 +0000
Connection: close
X-Powered-By: PHP/7.1.16
X-FlagPart3: 59e0575e42f
Content-type: text/html; charset=UTF-8
```

The last part is there!

---

Congrats you found the flag! `FLAG-56881033be924c54b3159e0575e42f` 🚩 🎉
