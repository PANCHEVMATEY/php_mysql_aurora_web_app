# Create 2 Subnets
#Public for the EC2
resource "aws_subnet" "web-server-sub-pub" {
  vpc_id            = aws_vpc.aws-vpc.id
  cidr_block = var.subnet_cidr_block
  availability_zone = var.availability_zones[0]
  tags = {
    Name = "${lookup(var.subnet_type, "public")}-subnet-1"
  }
}
#Private for Aurora cluster
resource "aws_db_subnet_group" "aurora-sub-private" {
  name = "aurora-subnet-group"
  description = "Aurora mysql cluster db subnet group"
  subnet_ids = [data.aws_subnet.subnets.vpc_id]
  tags = {
    Name = "${lookup(var.subnet_type, "private")}-subnet-1"
  }
}