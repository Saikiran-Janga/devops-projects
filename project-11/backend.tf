terraform {

  backend "s3" {

    bucket = "saikiran-terraform-state-bucket" 

    key    = "project-11/terraform.tfstate"

    region = "us-east-1"

  }

}
