resource "aws_instance" "ec2_instance" {
  ami                    = "ami-830c94e3"
  instance_type          = "t2.micro"
  subnet_id                   = aws_subnet.my_app.id
  # Add the security group to the EC2 instance to allow the HTTP and SSH traffic.
  vpc_security_group_ids   = [aws_security_group.allow_http_ssh.id]

  # Assign a public IP address to the EC2 instance.
  associate_public_ip_address = true

  # Execute ustom commands into the EC2 instance at startup
  # Install Docker
  user_data = <<-EOF
  #!/bin/bash
  curl -fsSL https://get.docker.com -o get-docker.sh
  sudo sh get-docker.sh
  sudo groupadd docker
  sudo usermod -aG docker ubuntu
  newgrp docker
  EOF

  tags = {
    Name = "EC2-NODE-1"
  }
}
