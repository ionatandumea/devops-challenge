resource "aws_instance" "ec2-node-1" {
  ami                    = data.aws_ami.ubuntu.id
  instance_type          = "t3.micro"
  availability_zone      = var.AVAILABILITY_ZONE
  subnet_id              = aws_subnet.public-subnet.id
  vpc_security_group_ids = [aws_security_group.allow-http-ssh.id]
  key_name               = "ssh-key"

  user_data = <<-EOF
  #!/bin/bash
  curl -fsSL https://get.docker.com -o get-docker.sh
  sudo sh get-docker.sh
  sudo groupadd docker
  sudo usermod -aG docker ubuntu
  newgrp docker

  sudo curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
  sudo chmod +x /usr/local/bin/docker-compose
  EOF

  tags = {
    Name = "ec2-node-1"
  }
}
