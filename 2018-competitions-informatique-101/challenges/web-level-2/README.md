# Web Challenge

The admin land.

http://localhost:11112/

> web

## Setup

Requirements:
- docker

Start:

```shell
docker-compose up
```

## Writeup

Go to http://localhost:11112/.

Inspect the source code.

It looks like there is a land that is hidden:

```html
<!--
<li>
	<a href="/?land=adminland">Admin Land</a>
</li>
-->
```

If we try to go to http://localhost:11112/?land=adminland, we have this message:

```html
<p>
	Your are not an admin, you can't see the <strong>Admin Land</strong>!
</p>
```

Inspect the HTTP headers in the request.

The server returns a custom header:

```
X-Admin: false
```

If we try to access http://localhost:11112/?land=adminland setting the customer header to:

```
X-Admin: true
```

We have this response:

```html
<h1 class="mt-5">Admin Land</h1>
		 <p>A nice picture of me! Also my secret: FLAG-bb3df76f05b4064f5906f945460fe8dd.</p>
		 <img class="land" src="https://upload.wikimedia.org/wikipedia/commons/thumb/9/9e/Guy_Steele.jpg/486px-Guy_Steele.jpg" alt="Admin Land">
```

You have the flag good job! 

`FLAG-bb3df76f05b4064f5906f945460fe8dd` 🚩

![The Admin](https://upload.wikimedia.org/wikipedia/commons/thumb/9/9e/Guy_Steele.jpg/486px-Guy_Steele.jpg)
