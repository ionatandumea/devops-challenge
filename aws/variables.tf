variable "SSH_PUBLIC_KEY" {
  description = "Public SSH key for logging into EC2 instance"
  type        = string
}

variable "AVAILABILITY_ZONE" {
  description = "The availability zone for the EC2 instance"
  type        = string
}
