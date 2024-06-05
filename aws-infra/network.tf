resource "aws_vpc" "main" {
  cidr_block           = "10.0.0.0/16"
  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = {
    Name = "EC2 Instance VPS"
	}
}

# Elastic IP resource to create a static ip to make sure the ip of the EC2 instance is ramining the same if it goes down or we re-create it.
resource "aws_eip" "ec2_instance_ip" {
  instance = aws_instance.ec2_instance.id
  vpc      = true
}

# Subnet
resource "aws_subnet" "my_app" {
  cidr_block        = cidrsubnet(aws_vpc.main.cidr_block, 3, 1)
  vpc_id            = aws_vpc.main.id
}

resource "aws_route_table" "my_app" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.my_app.id
  }

  tags = {
    Name = "my_app"
  }
}

resource "aws_route_table_association" "subnet-association" {
  subnet_id      = aws_subnet.my_app.id
  route_table_id = aws_route_table.my_app.id
}

# Gateway

resource "aws_internet_gateway" "my_app" {
  vpc_id = aws_vpc.main.id
  tags = {
    Name = "my_app"
  }
}
