provider "aws" {
  region = "us-east-1"
}

resource "aws_security_group" "ssh_sg" {

  name = "project12-ssh-sg"

  ingress {
    from_port   = 22
    to_port     = 22
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

resource "aws_instance" "web_server" {

  ami           = "ami-084568db4383264d4"

  instance_type = "m7i-flex.large"

  key_name = "Devops_Project_Key"

  vpc_security_group_ids = [
    aws_security_group.ssh_sg.id
  ]

  tags = {
    Name = "Project-12-EC2"
  }
}
