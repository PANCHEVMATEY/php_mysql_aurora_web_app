module "aurora_rds" {
  source = "modules/aurora_rds"

  cluster_identifier = "dev-aurora-cluster"
  vpc_id             = "vpc-074122c84e592aa97"            # Replace with your VPC ID
  cidr_block = "172.31.0.0/16"
  availability_zones = ["us-central-1a", "us-central-1b"] # Replace with your AZs
  database_name      = "mysql-aurora-dev"
  master_username    = "admin"
  master_password    = "password"
  min_capacity       = 1
  max_capacity       = 2
  tags = {
    Name = "dev-aurora-cluster"
  }
  region = "eu-central-1"
  subnets = "var.subnets.id"
}

`