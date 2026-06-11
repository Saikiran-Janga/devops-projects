provider "aws" {
  region = "us-east-1"
}

resource "aws_s3_bucket" "terraform_state" {

  bucket = "saikiran-terraform-state-bucket"

  tags = {
    Name = "Terraform-State-Bucket"
  }
}
