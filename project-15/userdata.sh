#!/bin/bash

dnf update -y

dnf install docker -y

systemctl enable docker

systemctl start docker

mkdir -p /opt/website

cat <<EOF > /opt/website/index.html
<!DOCTYPE html>
<html>
<head>
    <title>Saikiran DevOps Project</title>
</head>
<body>
    <h1>Welcome to Saikiran's DevOps Project</h1>
    <h2>Terraform + Docker + Nginx</h2>
</body>
</html>
EOF

docker pull nginx

docker run -d \
-p 80:80 \
-v /opt/website:/usr/share/nginx/html \
--name nginx \
nginx
