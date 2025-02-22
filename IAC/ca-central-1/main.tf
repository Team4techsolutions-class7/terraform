provider "aws" {
  region = "ca-central-1"
}

# IAM Role for EC2
resource "aws_iam_role" "ec2_role" {
  name = "EC2InstanceRole"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Action = "sts:AssumeRole"
      Effect = "Allow"
      Principal = {
        Service = "ec2.amazonaws.com"
      }
    }]
  })
}

resource "aws_iam_policy_attachment" "ec2_attach" {
  name       = "EC2PolicyAttach"
  roles      = [aws_iam_role.ec2_role.name]
  policy_arn = "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"  # ✅ Attach SSM policy
}

resource "aws_iam_instance_profile" "ec2_profile" {
  name = "EC2InstanceProfile"
  role = aws_iam_role.ec2_role.name
}

# Calling the EC2 Module
module "ec2_instance" {
  source              = "../modules/ec2-instance"
  ami_id              = "ami-0c9f6749650d5c0e3"
  instance_type       = "t2.micro"
  instance_name       = "Jenkins"
  ebs_optimized       = true
  monitoring          = true
  iam_instance_profile = aws_iam_instance_profile.ec2_profile.name
}
