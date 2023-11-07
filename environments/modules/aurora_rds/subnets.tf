# Create Subnets
#Public for the ALB
resource "aws_subnet" "web-server-sub-pub" {
  vpc_id                  = aws_vpc.aws-vpc.id
  cidr_block              = lookup(var.subnet_cidr_block, "public-subnet-1")
  availability_zone       = element(var.availability_zones, 0)
  map_public_ip_on_launch = true
  tags = {
    Name = "${lookup(var.subnet_type, "public")}-subnet-1"
  }
}

resource "aws_subnet" "web-server-sub-pub-2" {
  vpc_id                  = aws_vpc.aws-vpc.id
  cidr_block              = lookup(var.subnet_cidr_block, "public-subnet-2")
  availability_zone       = element(var.availability_zones, 1)
  map_public_ip_on_launch = true
  tags = {
    Name = "${lookup(var.subnet_type, "public")}-subnet-2"
  }
}

#Private web ASG
resource "aws_subnet" "private-web-app-1" {
  vpc_id            = aws_vpc.aws-vpc.id
  cidr_block        = lookup(var.subnet_cidr_block, "private-subnet-app-1")
  availability_zone = element(var.availability_zones, 0)
  tags = {
    Name = "${lookup(var.subnet_type, "private")}-subnet-web-1"
  }
}

resource "aws_subnet" "private-web-app-2" {
  vpc_id            = aws_vpc.aws-vpc.id
  cidr_block        = lookup(var.subnet_cidr_block, "private-subnet-app-2")
  availability_zone = element(var.availability_zones, 1)
  tags = {
    Name = "${lookup(var.subnet_type, "private")}-subnet-web-2"
  }
}

#Private for Aurora cluster
resource "aws_subnet" "aurora-private-subnet-1" {
  vpc_id            = aws_vpc.aws-vpc.id
  cidr_block        = lookup(var.subnet_cidr_block, "private-subnet-1")
  availability_zone = element(var.availability_zones, 0)
  tags = {
    Name = "${lookup(var.subnet_type, "private")}-aurora-subnet-1"
  }
}

resource "aws_subnet" "aurora-private-subnet-2" {
  vpc_id            = aws_vpc.aws-vpc.id
  cidr_block        = lookup(var.subnet_cidr_block, "private-subnet-2")
  availability_zone = element(var.availability_zones, 1)
  tags = {
    Name = "${lookup(var.subnet_type, "private")}-aurora-subnet-2"
  }
}

resource "aws_subnet" "aurora-private-subnet-3" {
  vpc_id            = aws_vpc.aws-vpc.id
  cidr_block        = lookup(var.subnet_cidr_block, "private-subnet-3")
  availability_zone = element(var.availability_zones, 2)
  tags = {
    Name = "${lookup(var.subnet_type, "private")}-aurora-subnet-3"
  }
}

#Aurora DB Subnet group
resource "aws_db_subnet_group" "aurora-db-subnet-group" {
  name        = "aurora-subnet-group"
  description = "Aurora mysql cluster db subnet group"
  subnet_ids  = [aws_subnet.aurora-private-subnet-1.id, aws_subnet.aurora-private-subnet-2.id, aws_subnet.aurora-private-subnet-3.id]
  tags = {
    Name = "My DB subnet group"
  }
}