# Create an AWS EC2 instance named "web-server."
resource "aws_instance" "web-server" {
  ami             = var.instance_data.image-id
  instance_type   = var.instance_data.instance_type
  subnet_id       = aws_subnet.web-server-sub-pub.id
  security_groups = [aws_security_group.VPC-sg.name]
  # Define the user data script that will be executed when the instance launches.
  user_data = <<-EOF
                #!/bin/bash
                yum update -y
                amazon-linux-extras install -y php7.2
                yum install -y httpd
                systemctl start httpd
                systemctl enable httpd
                usermod -a -G apache ec2-user
                chown -R ec2-user:apache /var/www
                chmod 2775 /var/www
                find /var/www -type d -exec chmod 2775 {} \;
                find /var/www -type f -exec chmod 0664 {} \;
                cd /var/www/html
                wget https://raw.githubusercontent.com/AbhishekGit-AWS/beanStalk/master/index.php
              EOF

  tags = {
    Name = var.instance_data.name-prefix
  }
}
