output "aurora_cluster_id" {
  description = "The ID of the created Aurora cluster."
  value       = aws_rds_cluster.aurora.id
}
