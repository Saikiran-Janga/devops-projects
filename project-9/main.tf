provider "aws" {
  region = var.region
}

resource "aws_instance" "web_server" {
  ami           = "ami-084568db4383264d4"
  instance_type = var.instance_type

  tags = {
    Name = var.server_name
  }
}
