# Configure the network for the EC2 instance
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
