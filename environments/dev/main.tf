module "aurora_rds" {
  source = "../modules/aurora_rds"

  cluster_identifier = var.cluster_identifier
  availability_zones = var.availability_zones
  database_name      = var.database_name
  master_username    = var.master_username
  master_password    = var.master_password
  min_capacity       = var.min_capacity
  max_capacity       = var.max_capacity
  tags = {
    Name = var.tags
  }
  region = var.region
  vpc_cidr_block = var.vpc_cidr_block
  subnet_cidr_block = var.subnet_cidr_block
}

