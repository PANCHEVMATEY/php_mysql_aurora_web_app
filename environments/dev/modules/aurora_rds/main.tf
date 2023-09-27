resource "aws_rds_cluster" "aurora" {
  cluster_identifier = var.cluster_identifier
  engine             = "aurora-mysql"
  engine_mode        = "serverless"
  engine_version         = "5.7.mysql_aurora.2.07.1"
  availability_zones = var.availability_zones
  database_name      = var.database_name
  master_username    = var.master_username
  master_password    = var.master_password

  scaling_configuration {
    min_capacity = var.min_capacity
    max_capacity = var.max_capacity
  }

  tags = var.tags

}





