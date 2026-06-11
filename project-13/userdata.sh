#!/bin/bash

yum update -y

yum install docker -y

systemctl start docker

systemctl enable docker
echo "Hello Saikiran" > /root/message.txt
