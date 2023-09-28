# Create a IGW
resource "aws_internet_gateway" "internet-gateway" {
  vpc_id = var.vpc_id
  tags = {
    Name = "internet-gateway"
  }
}