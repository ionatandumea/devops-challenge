# Terraform settings including the aws provider the terraform will use to provision our infrastrucutre
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  required_version = ">= 1.2.0"
}

# This provider block configures the AWS provider
provider "aws" {
  region = "us-west-2a"
}
