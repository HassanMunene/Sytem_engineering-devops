# 1-Server Web Infrastructure
This refers to a single physical server that performs all the necessary functions required to serve a website. I this infrastructure all the components of the web application: web server, application server, database server are installed on the same physical machine

The follwing below is a simple example of what happens when a user types [](www.foobar.com) on the web browser and the architecture being used is 1-server

1. The user types the URL on the address bar of the browser such as chrome or firefox. The URL in our case is [](www.foobar.com)
2. After that the user has entered the URL the next step is to convert the URL to an Ip address that can locate the server that contains the web page we need
therefore the browser sends a DNS request to resolve [](www.foobar.com) domain name to an ip address. Once the DNS has resolved the domain name it sends back the ip address to the browser as requested.
3. Now that the web browser has the the ip address of the web server, the browser send an HTTP request to the web server.
	- let's take a look of what an HTTP request looks like

```
con.ico HTTP/1.1
Host: www.foobar.com
User-Agent: Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:109.0) Gecko/20100101 Firefox/111.0
Accept: image/avif,image/webp,*/*
Accept-Language: en-US,en;q=0.5
Accept-Encoding: gzip, deflate
Connection: keep-alive
Referer: http://www.foobar.com/
```

4. The webserver we are sending our request too is protected by a firewall which is a security device that monitors and controls incoming and outgoing network traffic based on a set of rules

5. After the request has been allowed in by the firewall, the incoming request is received by the web server which in our case is Nginx server 

