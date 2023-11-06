# Create a IGW
resource "aws_internet_gateway" "internet-gateway" {
  vpc_id = aws_vpc.aws-vpc.id
  tags = {
    Name = "Internet-gateway"
  }
}