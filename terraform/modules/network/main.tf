resource "aws_vpc" "this" {
  cidr_block = "10.20.0.0/16"
  tags = {
    Name        = "vpc-${var.environment}"
    Owner       = var.owner
    Sovereignty = "IE"
  }
}

resource "aws_subnet" "app" {
  vpc_id            = aws_vpc.this.id
  cidr_block        = "10.20.10.0/24"
  availability_zone = "${var.region}a"
  tags = {
    Name = "subnet-app-${var.environment}"
  }
}
