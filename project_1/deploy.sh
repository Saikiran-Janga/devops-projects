#!/bin/bash

echo "Stopping old container..."

docker rm -f flask-container || true

echo "Building image..."

docker build -t flask-app .

echo "Starting container..."

docker run -d -p 80:5000 \
--name flask-container \
flask-app

echo "Deployment Complete"
