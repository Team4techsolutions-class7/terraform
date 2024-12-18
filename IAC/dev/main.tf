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
  region = "ca-central-1"
}

module "ec2_instance" {
  source        = "../modules/ec2-instance"
  ami_id        = "ami-0bee12a638c7a8942"
  instance_type = "t2.micro"
  instance_name = "Jenkins"
}

