data "aws_availability_zones" "zones" {
  state = "available"
}

data "aws_vpc" "vpc" {
  id = var.vpc_id
}

