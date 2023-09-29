# Create a Security Group
resource "aws_security_group" "VPC-sg" {
  name        = "VPC-sg"
  description = "Allow traffic from anywhere to VPC"
  vpc_id      = aws_vpc.aws-vpc.id

  ingress {
    description = "HTTP ingress rule"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    description = "SSH ingress rule"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "allow_http"
  }
}
# Create a Security Group
resource "aws_security_group" "Aurora-security-group" {
  name        = "Aurora-security-group"
  description = "Allow inbound traffic to Aurora"
  vpc_id      = aws_vpc.aws-vpc.id

  ingress {
    description     = "Aurora Cluster Security Group"
    from_port       = 3306
    to_port         = 3306
    protocol        = "TCP"
    security_groups = [aws_security_group.VPC-sg.id]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "Allow traffic to Aurora cluster"
  }

}