module "aurora_rds" {
  source = "../modules/aurora_rds"

  cluster_identifier = var.cluster_identifier
  vpc_id             = var.vpc_id
  availability_zones = var.availability_zones
  database_name      = var.database_name
  master_username    = var.master_username
  master_password    = var.master_password
  min_capacity       = 1
  max_capacity       = 2
  tags = {
    Name = var.tags
  }
  region = var.region
  cidr_ranges = var.cidr_ranges
  vpc_cidr_block = var.vpc_cidr_block
  environment     = var.environment
}

