resource "aws_instance" "ec2" {
  ami                  = var.ami_id
  instance_type        = var.instance_type
  ebs_optimized        = true
  monitoring           = true
  iam_instance_profile = aws_iam_instance_profile.ec2_profile.name  # ✅ Attach IAM role

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

# IAM Role and Instance Profile
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
