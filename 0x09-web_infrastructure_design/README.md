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

5. After the request has been allowed in by the firewall, the incoming request is received by the web server which in our case is Nginx server which forwards the request to application server. The application server is the one that is hosting our codebase and generate the dynamic content of the website.

6. For it to generate the dynamic content it requires some data from the database, the apliccation serve retrieves the data from MySQL database.

7. After the web content has been generate the applicatin server sends back the content to nginx server which in turn send back the information as an HTTP response. the following below is an example of an HTTP response

```
HTTP/1.1 200 OK
Content-Type: text/html; charset=UTF-8
Content-Length: 1234
Date: Sat, 27 Mar 2023 10:30:00 GMT
Server: Nginx/2.4.29 (Ubuntu)

<!DOCTYPE html>
<html>
<head>
	<title>Example HTTP Response</title>
</head>
<body>
	<h1>Hello, World!</h1>
	<p>This is an example HTTP response.</p>
</body>
</html>
```

![1-server structure](https://github.com/HassanMunene/alx-system_engineering-devops/blob/master/0x09-web_infrastructure_design/imgs/image.jpg)

# 3-SERVER WEB INFRASTRUCTURE & LOAD BALANCER(HAproxy)
In a type of infrastrucutre we will have to add 2 more servers and 1 loadbalancer(HAproxy) This is necessary because when the traffic inreases and the requests becomes too many for once server to handle we need to add more servers. well when we add those servers, how do we now know which request to go to server1 and which request to go to server2 and so on. This is where the loadbalancer comes in to help us. A load balancer is like a traffic cop that direct cars in a busy junction. 

## Load Balancer - It is used to distribute incoming traffic across multiple web servers. This improves the availability and scalability of the website by allowing multiple web servers to handle the requests.

The algorithm that we will use to redirect the request is the round robin algorithm whereby the requests are distributed across the group of servers sequentially and evenly

## web servers - we will add two more web servers each runnig nginx web server software. The web server will host the website's static files and serve them to visitors. The load balancer will disribute incoming traffic across these web servers

## Application server - we will add one application server to host the application codebase. The application server will serve dyna,ic content to visitors. The web servers will be configured to forward these requests for dyna,,ic content to the application server

## Database - we will add a MySQL database server to store websites data such as user information, comments an posts. The database will be configured as a Primary-Replica(Master-Slave)cluster, where the primary node will handle wites and the replica will handle reads. The primary node will replicate data changes to the replica node to ensure data consistency

load balancer will be configured with round robin distribution algorithm which distributes requests evenly across all available web servers. The load balancer will enable an active-active setup, where all servers are actively handling requests.

In database the primary node will handle the writes and replicate data changes to the replica node to ensure data consistency.

## SINGLE POINT OF FAILURE(SPOF)

There is a single point of failure in this system and that's the load balancer. If it goes down traffic will not be distributed to the web servers and the website will become unvailable.

## Security Issues

No firewall in this system, there is no HTTP. Without firewall the servers are vulnerable to attacks from outside sources. without https the traffic to and from the website is not encrypted, making it vulnarable to interception and tampering

## Monitoring

There is no monitoring setup for this infrastructure, which makes it difficult to detect and address issues in a timely manner. Monitoring tools should be implemented to alert administrators of any issues and provide insights into system performance.

# SECURED AND MONITORED WEB INFRASTRUCTURE

![sec&monitored-web](https://github.com/HassanMunene/alx-system_engineering-devops/blob/master/0x09-web_infrastructure_design/imgs/Network_Architecture_-_Secure_and_monitored_web_infrastructure_page-0001.jpg)


