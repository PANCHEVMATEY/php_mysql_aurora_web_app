php_mysql_aurora_web_app

This repository contains a simple Terraform module for deploying a PHP web application with an Aurora database cluster. The module supports both development (dev) and production (prod) environments.

Getting Started To use this module with multiple environments, you need to create an Amazon S3 bucket to store the Terraform state. Follow these steps:

Installation
Clone the repository to your local machine:

git clone [https://github.com/your-username/php_mysql_aurora_web_app.git](https://github.com/PANCHEVMATEY/php_mysql_aurora_web_app.git)

aws s3 mb s3://tfvars-envs

terraform init

terraform validate

terraform plan

terraform apply

Remember to adjust the module's configuration files and variables according to your specific requirements and environment settings.
