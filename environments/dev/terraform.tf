provider "aws" {
  region = "eu-central-1"
}
terraform {
  required_version = ">= 1.4"
  backend "s3" {
    bucket = "tfvars-envs-bucket"
    region = "eu-central-1"
    key    = "dev/terraform.tfstate"
  }
}