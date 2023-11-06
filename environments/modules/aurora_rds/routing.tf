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
  depends_on = [aws_internet_gateway.internet-gateway]
}

resource "aws_route_table" "private-subnet-routing-to-NAT" {
  vpc_id = aws_vpc.aws-vpc.id
  route {
    cidr_block     = aws_subnet.aurora-private-subnet-1.cidr_block
    nat_gateway_id = aws_nat_gateway.nat-gateway-1.id
  }
  route {
    cidr_block     = aws_subnet.aurora-private-subnet-2.cidr_block
    nat_gateway_id = aws_nat_gateway.nat-gateway-1.id
  }
  route {
    cidr_block     = aws_subnet.aurora-private-subnet-3.cidr_block
    nat_gateway_id = aws_nat_gateway.nat-gateway-1.id
  }
  tags = {
    Name = "Routing table to private subnet"
  }
}

# Associate Routing Tables
resource "aws_route_table_association" "public-associate" {
  subnet_id      = aws_subnet.web-server-sub-pub.id
  route_table_id = aws_route_table.internet-gateway.id
}

resource "aws_route_table_association" "public-associat-2" {
  subnet_id      = aws_subnet.web-server-sub-pub-2.id
  route_table_id = aws_route_table.internet-gateway.id
}

resource "aws_route_table_association" "private-associate-1" {
  subnet_id      = aws_subnet.aurora-private-subnet-1.id
  route_table_id = aws_route_table.private-subnet-routing-to-NAT.id
}

resource "aws_route_table_association" "private-associate-2" {
  subnet_id      = aws_subnet.aurora-private-subnet-2.id
  route_table_id = aws_route_table.private-subnet-routing-to-NAT.id
}

resource "aws_route_table_association" "private-associate-3" {
  subnet_id      = aws_subnet.aurora-private-subnet-3.id
  route_table_id = aws_route_table.private-subnet-routing-to-NAT.id
}