provider "aws" {
  region = "ca-central-1"
}

module "ec2_instance" {
  source        = "../modules/ec2-instance"
  ami_id        = "ami-0c9f6749650d5c0e3"
  instance_type = "t2.micro"
  instance_name = "Jenkins"
}


