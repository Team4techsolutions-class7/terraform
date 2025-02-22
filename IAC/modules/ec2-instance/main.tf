resource "aws_instance" "ec2" {
  ami           = var.ami_id
  instance_type = var.instance_type

  tags = {
    Name = var.instance_name
  }

  metadata_options {
    http_tokens = "required"
  }

  root_block_device {
    encrypted = true
  }
}
