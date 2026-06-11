provider "aws" {
  region = "us-east-1"
}

resource "aws_security_group" "nginx_sg" {

  name = "project14-nginx-sg"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "nginx_server" {

  ami           = "ami-0152204c1a187337c"

  instance_type = "m7i-flex.large"

  key_name = "Devops_Project_Key"

  vpc_security_group_ids = [
    aws_security_group.nginx_sg.id
  ]

  user_data = file("userdata.sh")

  tags = {
    Name = "Project-14-Nginx-Server"
  }
}
