# Create an AWS EC2 instance named "web-server."
resource "aws_instance" "web-server" {
  ami             = var.instance_data.image-id
  instance_type   = var.instance_data.instance_type
  subnet_id       = aws_subnet.web-server-sub-pub.id
  security_groups = [aws_security_group.VPC-sg.name]
  # Define the user data script that will be executed when the instance launches.
  user_data = filebase64("${path.module}/user_data.sh")
  tags = {
    Name = var.instance_data.name-prefix
  }
}
