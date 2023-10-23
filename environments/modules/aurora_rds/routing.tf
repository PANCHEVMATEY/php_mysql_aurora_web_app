# Create Routing Tables
resource "aws_route_table" "internet-gateway" {
  vpc_id = aws_vpc.aws-vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.internet-gateway.id
  }
  tags = {
    Name = "Routing table to IGW"
  }
}
# Associate Routing Tables
resource "aws_route_table_association" "terraform-associate1" {
  subnet_id      = aws_subnet.web-server-sub-pub.id
  route_table_id = aws_route_table.internet-gateway.id
}