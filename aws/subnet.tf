resource "aws_subnet" "public-subnet" {
  cidr_block        = "10.0.0.0/24"
  vpc_id            = aws_vpc.main.id
  availability_zone = var.AVAILABILITY_ZONE

  depends_on = [aws_internet_gateway.igw]
}

resource "aws_route_table" "route_table" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = "Route Table"
  }
}

resource "aws_route_table_association" "subnet-association" {
  subnet_id      = aws_subnet.public-subnet.id
  route_table_id = aws_route_table.route_table.id
}
