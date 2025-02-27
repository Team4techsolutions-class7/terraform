terraform {
  required_version = ">= 1.3.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 3.0.0"
    }
  }
}

provider "aws" {
  region = "eu-west"
}

module "ec2_instance" {
  source        = "../modules/ec2-instance"
  ami_id        = "ami-0c9f6749650d5c0e3"
  instance_type = "t2.micro"
  instance_name = "Jenkins"
