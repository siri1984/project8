# Create Internet Gateway
resource "aws_internet_gateway" "IGW" {
  vpc_id = aws_vpc.project8-vpc.id

  tags = {
    Name = "Project8-IGW"
  }
}
# Create Web layber route table
resource "aws_route_table" "Web-RT" {
  vpc_id = aws_vpc.project8-vpc.id


  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.IGW.id
  }

  tags = {
    Name = "Web-RT"
  }
}
# Create Web Subnet association with Web route table
resource "aws_route_table_association" "a" {
  subnet_id      = aws_subnet.WebApp-Sub-1.id
  route_table_id = aws_route_table.Web-RT.id
}

resource "aws_route_table_association" "b" {
  subnet_id      = aws_subnet.WebApp-Sub-2.id
  route_table_id = aws_route_table.Web-RT.id
}