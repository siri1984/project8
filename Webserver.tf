#Create EC2 Instance
resource "aws_instance" "WebServer1" {
  ami                    = "ami-0d37e07bd4ff37148"
  instance_type          = "t2.micro"
  availability_zone      = "eu-west-2a"
  vpc_security_group_ids = [aws_security_group.WebServer-SG.id]
  subnet_id              = aws_subnet.WebApp-Sub-1.id
  user_data              = file("install_apache.sh")

  tags = {
    Name = "Web Server"
  }

}
resource "aws_instance" "WebServer2" {
  ami                    = "ami-0d37e07bd4ff37148"
  instance_type          = "t2.micro"
  availability_zone      = "eu-west-2b"
  vpc_security_group_ids = [aws_security_group.WebServer-SG.id]
  subnet_id              = aws_subnet.WebApp-Sub-2.id
  user_data              = file("install_apache.sh")

  tags = {
    Name = "Web Server"
  }

}