resource "aws_key_pair" "ssh-key" {
  key_name   = "ssh-key"
  public_key = var.SSH_PUBLIC_KEY
}
