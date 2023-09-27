variable "vpc_id" {
  description = "The ID of the VPC where the Aurora cluster will be deployed."
  type        = string
}

variable "cidr_block" {
  description = "CIDR block for ingress rules."
  type        = string
}

variable "availability_zones" {
  description = "A list of availability zones for the Aurora cluster."
  type        = list(string)
}

variable "cluster_identifier" {
  description = "The unique identifier for the Aurora cluster."
  type        = string
}

variable "database_name" {
  description = "The name of the initial database in the Aurora cluster."
  type        = string
}

variable "master_username" {
  description = "The master username for the Aurora cluster."
  type        = string
}

variable "master_password" {
  description = "The master password for the Aurora cluster."
  type        = string
}

variable "min_capacity" {
  description = "The minimum capacity for auto-scaling."
  type        = number
}

variable "max_capacity" {
  description = "The maximum capacity for auto-scaling."
  type        = number
}

variable "tags" {
  description = "A map of tags to apply to the resources."
  type        = map(string)
}

variable "region" {
  description = "AWS region"
  type        = string
}
variable "subnets" {
  description = "List of subnet IDs to use"
  type        = string
}

