variable "cluster_identifier" {
  description = "Identifier for the Aurora cluster."
  type        = string
}

variable "vpc_id" {
  description = "The ID of the VPC where the Aurora cluster will be deployed."
  type        = string
}

variable "availability_zones" {
  description = "List of availability zones where Aurora instances will be placed."
  type        = list(string)
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
  type        = string
}

variable "region" {
  description = "AWS region"
  type        = string
}

variable "cidr_ranges" {
  description = "Specify CIDR ranges."
  type        = string
}

variable "vpc_cidr_block" {
  description = "Specify the VPC CIDR block."
  type        = string
}

variable "environment" {
  description = "Environment variable"
  type        = string
}
