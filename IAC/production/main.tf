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

  # Assume the Github-access role in the main account
  assume_role {
    role_arn     = "arn:aws:iam::891377304437:role/Github-access"
    session_name = "terraform-session"
  }
}

module "ec2_instance" {
  source        = "../modules/ec2-instance"
  ami_id        = "ami-0c9f6749650d5c0e3"
  instance_type = "t2.micro"
  instance_name = "Jenkins"
}
