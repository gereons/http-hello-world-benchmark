#!/bin/bash

docker rm -f spark_hello hello_nginx hello_node hello_golang hello_cgi hello_cgid springboot_hello undertow_hello fasthttp_hello cgi_hello cgid_hello vapor_hello perfect_hello kitura_hello zewo_hello 2> /dev/null 1> /dev/null

case "$OSTYPE" in
    darwin*)    NET="";;
    *)          NET="--net=host";;
esac

pid=$(docker run $NET -d --name undertow_hello -p 8080:8080 hello_undertow)
sleep 10
echo
echo "-- HELLO Undertow --"
wrk -c 20 -t 4 -d 20 http://127.0.0.1:8080
echo
echo "-- HELLO Undertow --"
wrk -c 20 -t 4 -d 20 http://127.0.0.1:8080
docker rm -f $pid

pid=$(docker run $NET -d --name springboot_hello -p 8080:8080 hello_springboot)
sleep 10
echo
echo "-- HELLO Spring-Boot 1 --"
wrk -c 20 -t 4 -d 20 http://127.0.0.1:8080
echo
echo "-- HELLO Spring-Boot 2 --"
wrk -c 20 -t 4 -d 20 http://127.0.0.1:8080
docker rm -f $pid

sleep 5
pid=$(docker run $NET -d --name spark_hello -p 8080:8080 hello_javaspark)
echo
echo "-- HELLO Javaspark 1 --"
wrk -c 20 -t 4 -d 20 http://127.0.0.1:8080
echo
echo "-- HELLO Javaspark 2 --"
wrk -c 20 -t 4 -d 20 http://127.0.0.1:8080
docker rm -f $pid

pid=$(docker run --net=host -d --name cgi_hello -p 80:80 hello_cgi)
sleep 5
echo
echo "-- HELLO Apache/CGI/Shell 1 --"
wrk -c 20 -t 4 -d 20 http://127.0.0.1:80/cgi-bin/hello.cgi
echo
echo "-- HELLO Apache/CGI/Shell 2 --"
wrk -c 20 -t 4 -d 20 http://127.0.0.1:80/cgi-bin/hello.cgi
docker rm -f $pid

pid=$(docker run --net=host -d --name cgid_hello -p 80:80 hello_cgid)
sleep 5
echo
echo "-- HELLO Apache/cgid/Shell 1 --"
wrk -c 20 -t 4 -d 20 http://127.0.0.1:80/cgi-bin/hello.cgi
echo
echo "-- HELLO Apache/cgid/Shell 2 --"
wrk -c 20 -t 4 -d 20 http://127.0.0.1:80/cgi-bin/hello.cgi
docker rm -f $pid

sleep 1
echo
echo "-- HELLO nginx --"
pid=$(docker run $NET -d --name hello_nginx -p 80:80 hello_nginx)
sleep 1
wrk -c 20 -t 4 -d 20 http://127.0.0.1:80
docker rm -f $pid

sleep 1
echo
echo "-- HELLO node --"
pid=$(docker run $NET -d --name hello_node -p 8080:8080 -v $PWD:/work --workdir /work node node hello.js)
sleep 1
wrk -c 20 -t 4 -d 20 http://127.0.0.1:8080
docker rm -f $pid

sleep 1
echo
echo "-- HELLO go --"
pid=$(docker run $NET -d --name hello_golang -p 8080:8080 -v $PWD:/work --workdir /work golang go run hello.go)
sleep 1
wrk -c 20 -t 4 -d 20 http://127.0.0.1:8080
docker rm -f $pid

pid=$(docker run $NET -d --name fasthttp_hello -p 8080:8080 hello_fasthttp)
sleep 1
echo
echo "-- HELLO Fasthttp --"
wrk -c 20 -t 4 -d 20 http://127.0.0.1:8080
docker rm -f $pid

pid=$(docker run $NET -d --name vapor_hello -p 8080:8080 hello_swift_vapor)
sleep 1
echo
echo "-- HELLO Swift/Vapor --"
wrk -c 20 -t 4 -d 20 http://127.0.0.1:8080
docker rm -f $pid

pid=$(docker run $NET -d --name perfect_hello -p 8080:8080 hello_swift_perfect)
sleep 1
echo
echo "-- HELLO Swift/Perfect --"
wrk -c 20 -t 4 -d 20 http://127.0.0.1:8080
docker rm -f $pid

pid=$(docker run $NET -d --name kitura_hello -p 8080:8080 hello_swift_kitura)
sleep 1
echo
echo "-- HELLO Swift/Kitura --"
wrk -c 20 -t 4 -d 20 http://127.0.0.1:8080
docker rm -f $pid

pid=$(docker run $NET -d --name zewo_hello -p 8080:8080 hello_swift_zewo)
sleep 1
echo
echo "-- HELLO Swift/Zewo --"
wrk -c 20 -t 4 -d 20 http://127.0.0.1:8080
docker rm -f $pid
