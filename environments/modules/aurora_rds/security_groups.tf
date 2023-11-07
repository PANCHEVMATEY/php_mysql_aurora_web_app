# Create a Security Group
resource "aws_security_group" "ALB-sg" {
  name        = "ALB-sg"
  description = "Allow traffic from anywhere to VPC"
  vpc_id      = aws_vpc.aws-vpc.id

  ingress {
    description = "HTTP ingress rule"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "Allow_http"
  }
}


# Create a Security Group
resource "aws_security_group" "Webserver-sg" {
  name        = "Web-Sg"
  description = "Allow Sec1"
  vpc_id      = aws_vpc.aws-vpc.id

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    description = "HTTP"
    security_groups = [aws_security_group.ALB-sg.id]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    description = "HTTP"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "Allow Sec-1"
  }
}

resource "aws_security_group" "Aurora-security-group" {
  name        = "Aurora-security-group"
  description = "Allow inbound traffic to Aurora"
  vpc_id      = aws_vpc.aws-vpc.id

  ingress {
    description     = "Aurora Cluster Security Group"
    from_port       = 3306
    to_port         = 3306
    protocol        = "TCP"
    security_groups = [aws_security_group.Webserver-sg.id]
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