
provider "aws" {
  region = "us-east-1" 
}

module "ec2_instance" {
  source        = "./terraform-ec2-module"
  ami_id        = "ami-0c55b159cbfafe1f0"
  instance_type = "t2.micro"
  instance_name = "MyInstance"
}
