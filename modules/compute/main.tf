data "aws_ami" "al2023" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["al2023-ami-*-x86_64"]
  }
}

resource "aws_kms_key" "ebs" {
  description             = "EBS encryption key (${var.environment})"
  deletion_window_in_days = 7
}

resource "aws_security_group" "app" {
  name   = "app-sg-${var.environment}"
  vpc_id = var.vpc_id

  ingress {
    description = "SSH from approved CIDR only"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [var.ssh_cidr]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "app" {
  ami                    = data.aws_ami.al2023.id
  instance_type          = var.instance_type
  subnet_id              = var.subnet_id
  vpc_security_group_ids = [aws_security_group.app.id]

  metadata_options {
    http_endpoint = "enabled"
    http_tokens   = "required"
  }

  root_block_device {
    encrypted  = true
    kms_key_id = aws_kms_key.ebs.arn
  }

  tags = {
    Name        = "app-${var.environment}"
    Owner       = var.owner
    Sovereignty = "IE"
  }
}
