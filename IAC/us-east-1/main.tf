module "ec2_instance" {
  source        = "./terraform-ec2-module"
  ami_id        = "ami-0c55b159cbfafe1f0" # Replace with your AMI ID
  instance_type = "t2.micro"
  key_name      = "my-key-pair"
  subnet_id     = "subnet-0123456789abcdef"
  instance_name = "MyInstance"
  region        = "us-east-1"
}
