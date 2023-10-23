# Create 2 Subnets
#Public for the ASG
resource "aws_subnet" "web-server-sub-pub" {
  vpc_id            = aws_vpc.aws-vpc.id
  cidr_block        = var.subnet_cidr_block
  availability_zone = var.availability_zones[0]
  tags = {
    Name = "${lookup(var.subnet_type, "public")}-subnet-1"
  }
}

resource "aws_subnet" "web-server-sub-pub-2" {
  vpc_id            = aws_vpc.aws-vpc.id
  cidr_block        = var.subnet_cidr_block
  availability_zone = var.availability_zones[1]
  tags = {
    Name = "${lookup(var.subnet_type, "public")}-subnet-2"
  }
}

#Private for Aurora cluster

resource "aws_subnet" "aurora-private-subnet-1" {
  vpc_id            = aws_vpc.aws-vpc.id
  cidr_block        = var.subnet_cidr_block
  availability_zone = var.availability_zones[1]
  tags = {
    Name = "${lookup(var.subnet_type, "private")}-aurora-subnet-1"
  }
}

resource "aws_subnet" "aurora-private-subnet-2" {
  vpc_id            = aws_vpc.aws-vpc.id
  cidr_block        = var.subnet_cidr_block
  availability_zone = var.availability_zones[1]
  tags = {
    Name = "${lookup(var.subnet_type, "private")}-aurora-subnet-2"
  }
}
#Aurora DB Subnet group
resource "aws_db_subnet_group" "aurora-db-subnet-group" {
  name        = "aurora-subnet-group"
  description = "Aurora mysql cluster db subnet group"
  subnet_ids  = [aws_subnet.web-server-sub-pub.id, aws_subnet.web-server-sub-pub-2.id]
  tags = {
    Name = "My DB subnet group"
  }
}