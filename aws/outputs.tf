output "ec2-node-1-public-ip" {
  value = aws_instance.ec2-node-1.public_ip
}

output "ec2-node-1-private-ip" {
  value = aws_instance.ec2-node-1.private_ip
}
