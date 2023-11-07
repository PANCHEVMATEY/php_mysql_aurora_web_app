variable "vpc_cidr_block" {
  type        = string
  description = "CIDR block of your VPC."
  default     = "172.16.0.0/16"
}

variable "cluster_identifier" {
  description = "The unique identifier for the Aurora cluster."
  type        = string
  default     = "auroa-php"
}

variable "database_name" {
  description = "The name of the initial database in the Aurora cluster."
  type        = string
  default     = "Mydb"
}

variable "master_username" {
  description = "The master username for the Aurora cluster."
  type        = string
  default     = "Admin"
}

variable "master_password" {
  description = "The master password for the Aurora cluster."
  type        = string
  default     = "Password"
}

variable "min_capacity" {
  description = "The minimum capacity for auto-scaling."
  type        = number
  default     = 2
}

variable "max_capacity" {
  description = "The maximum capacity for auto-scaling."
  type        = number
  default     = 4
}

variable "tags" {
  type        = map(string)
  description = "Tags to apply to the resources."
  default = {
    Name        = "name"
    Environment = "dev"
  }
}

variable "region" {
  description = "AWS region"
  type        = string
  default     = "eu-west-1"
}

variable "subnet_type" {
  default = {
    public  = "public"
    private = "private"
  }
}

variable "subnet_cidr_block" {
  description = "CIDR block for the subnet."
  type        = map(string)
  default = {
    "public-subnet-1"      = "172.16.1.0/26"
    "public-subnet-2"      = "172.16.2.0/26"
    "private-subnet-app-1" = "172.16.3.0/26"
    "private-subnet-app-2" = "172.16.7.0/26"
    "private-subnet-1"     = "172.16.4.0/26"
    "private-subnet-2"     = "172.16.5.0/26"
    "private-subnet-3"     = "172.16.6.0/26"
  }
}
variable "availability_zones" {
  type        = list(string)
  description = "Availability zones"
  default     = ["eu-west-1a", "eu-west-1b", "eu-west-1c"]
}

variable "instance_data" {
  default = {
    name-prefix   = "Web-server"
    image-id      = "ami-0a1f6cc8163bdcc75"
    instance_type = "t2.micro"
  }
}