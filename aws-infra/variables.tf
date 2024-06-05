variable "ssh_public_key" {
  description = "Public SSH key for logging into EC2 instance"
  type        = string
}

variable "availability_zone" {
  description = "The availability zone for the EC2 instance"
  type        = string
}
