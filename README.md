---

# PHP MySQL Aurora Web Application

This repository contains a simple Terraform module for deploying a PHP web application with an Amazon Aurora database cluster. The module supports both development (dev) and production (prod) environments.

## Getting Started

To use this module with multiple environments, you need to create an Amazon S3 bucket to store the Terraform state. Follow these steps:

### Installation

1. Clone the repository to your local machine:

   ```bash
   git clone https://github.com/PANCHEVMATEY/php_mysql_aurora_web_app.git
   ```

2. Navigate to the environment directory you want to work with. For example, if you want to use the "dev" environment:

   ```bash
   cd dev
   ```

3. Create an Amazon S3 bucket to store the Terraform state. Make sure the bucket name is available and not already in use:

   ```bash
   aws s3 mb s3://tfvars-envs
   ```

4. Initialize Terraform in your working directory to download the necessary providers and modules:

   ```bash
   terraform init
   ```

5. Validate the correctness of your Terraform configuration files:

   ```bash
   terraform validate
   ```

6. Generate an execution plan to see what changes Terraform will make:

   ```bash
   terraform plan
   ```

7. If the plan looks correct and you are ready to deploy the resources, apply the Terraform configuration:

   ```bash
   terraform apply
   ```

   During this step, Terraform will create the AWS resources defined in your configuration.

8. Configuration Customization: Remember to adjust the module's configuration files and variables according to your specific requirements and environment settings. This step is important for customizing the deployment to your needs.

## Disclaimer

This README provides an overview of the installation process for deploying a PHP web application with an Amazon Aurora database cluster using Terraform. It's essential to replace placeholders and customize the configuration files according to your specific project requirements.

---