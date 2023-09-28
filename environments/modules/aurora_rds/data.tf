# This data source retrieves information about the Virtual Private Cloud (VPC)
# with the specified ID, which is set through the "vpc_id" variable.
data "aws_vpc" "vpc" {
  id = var.vpc_id
}
# This data source retrieves information about the subnets within the VPC specified
# by "vpc_id" and in the availability zone "eu-central-1a."
data "aws_subnet" "subnets" {
  vpc_id = var.vpc_id
  availability_zone = "eu-central-1a"
}