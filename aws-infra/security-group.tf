# We create a new security group to allow HTTP & SHH traffic to our EC2 instance
resource "aws_security_group" "allow_http_ssh" {
  name        = "allow_http_ssh"
  description = "Allow HTTP & SSH to our web server"
  vpc_id      = aws_vpc.main.id

  # Ingress determines which traffic can enter our Resource
  # Allow HTTP
  ingress {
    description = "HTTP ingress"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "SSH ingress"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Egress determines what traffic can leave from our resource, in this case all ports and protocols are allowed for outbound traffic.
  # Allow ALL
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
