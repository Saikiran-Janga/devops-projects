#!/bin/bash

dnf update -y

dnf install docker -y

systemctl enable docker

systemctl start docker

docker pull nginx

docker run -d -p 80:80 --name nginx nginx
