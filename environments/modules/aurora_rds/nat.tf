resource "aws_nat_gateway" "nat-gateway-1" {
  allocation_id = aws_eip.elastic-ip.id
  subnet_id     = aws_subnet.aurora-private-subnet-1.id
  tags = {
    Name = "nat-gateway"
  }
}

#resource "aws_nat_gateway" "nat-gateway-2" {
#  allocation_id = aws_eip.elastic-ip.id
#  subnet_id     = aws_subnet.aurora-private-subnet-2.id
#  tags = {
#    Name = "nat-gateway"
#  }
#}
#
#resource "aws_nat_gateway" "nat-gateway-3" {
#  allocation_id = aws_eip.elastic-ip.id
#  subnet_id     = aws_subnet.aurora-private-subnet-3.id
#  tags = {
#    Name = "nat-gateway"
#  }
#}

resource "aws_eip" "elastic-ip" {
  domain = "vpc"
}