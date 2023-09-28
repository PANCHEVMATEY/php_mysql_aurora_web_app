provider "aws" {
  region = "eu-ventral-1"
}
terraform {
  required_version = ">= 1.4"
  backend "s3" {
    bucket = "tfvars-envs"
    region = "eu-central-1"
    key    = "dev/terraform.tfstate"
  }
}