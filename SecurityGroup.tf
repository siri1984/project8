# Create WebApp Security Group
resource "aws_security_group" "WebApp-SG" {
  name        = "WebApp-SG"
  description = "Allow HTTP inbound traffic"
  vpc_id      = aws_vpc.project8-vpc.id

  ingress {
    description = "HTTP from VPC"
    from_port   = 80
    to_port     = 80
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
    Name = "WebApp-SG"
  }
}
# Create WebServer Security Group
resource "aws_security_group" "WebServer-SG" {
  name        = "WebServer-SG"
  description = "Allow inbound traffic from ALB"
  vpc_id      = aws_vpc.project8-vpc.id

  ingress {
    description     = "Allow traffic from web layer"
    from_port       = 80
    to_port         = 80
    protocol        = "tcp"
    security_groups = [aws_security_group.WebApp-SG.id]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "WebServer-SG"
  }
}
# Create Database Security Group
resource "aws_security_group" "DataBase-SG" {
  name        = "DataBase-SG"
  description = "Allow inbound traffic from application layer"
  vpc_id      = aws_vpc.project8-vpc.id

  ingress {
    description     = "Allow traffic from application layer"
    from_port       = 3306
    to_port         = 3306
    protocol        = "tcp"
    security_groups = [aws_security_group.WebServer-SG.id]
  }

  egress {
    from_port   = 32768
    to_port     = 65535
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "DataBase-SG"
  }
}
