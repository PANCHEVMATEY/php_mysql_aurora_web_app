module "aurora_rds" {
  source = "../modules/aurora_rds"

  cluster_identifier = "aurora-cluster"
  vpc_id             = "vpc-074122c84e592aa97"  # Replace with your VPC ID
  availability_zones = ["eu-central-1a", "eu-central-1b"]  # Replace with your AZs
  database_name      = "mysql-aurora-dev" # Replace with your desired name
  master_username    = "admin" # Replace with your desired name
  master_password    = "password" # Replace with your desired password
  min_capacity       = 1
  max_capacity       = 2
  tags = {
    Name = "aurora-cluster"
  }
  region = "eu-central-1" # Replace with your region
  cidr_ranges = ""
  vpc_cidr_block = "172.31.0.0/16"# Replace with your block
  environment     = var.environment
}

