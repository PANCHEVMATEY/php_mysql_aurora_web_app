variable "vpc_id" {
  description = "The ID of the VPC where the Aurora cluster will be deployed."
  type        = string
}

variable "vpc_cidr_block" {
  type        = string
  description = "CIDR block of your VPC."
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
  type        = map(string)
  description = "Tags to apply to the resources."
  default = {
    Name        = "dev-aurora-cluster"
    Environment = "dev"
  }
}

variable "region" {
  description = "AWS region"
  type        = string
}

variable "cidr_ranges" {
  type = string
}

variable "subnet_type" {
  default = {
    public  = "public"
    private = "private"
  }
}

variable "subnet_cidr_block" {
  description = "CIDR block for the subnet."
  type        = string
}
variable "availability_zones" {
  default = {
    availability_zone_1a = "eu-central-1a",
    availability_zone_1b = "eu-central-1b"
  }
}

variable "environment" {
  type = string
}

variable "instance_data" {
  default = {
    name-prefix   = "Web-server"
    image-id      = "ami-06dd92ecc74fdfb36"
    instance_type = "t2.micro"
  }
}