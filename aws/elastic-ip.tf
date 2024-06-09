resource "aws_eip" "elastic-ip" {
  domain     = "vpc"
  instance   = aws_instance.ec2-node-1.id
  depends_on = [aws_internet_gateway.igw]
}
