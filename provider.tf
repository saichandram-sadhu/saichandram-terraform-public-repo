terraform {
  cloud {
    organization = "saichandram-terraform-org"

    workspaces {
      name = "q3-ec2-nginx"
    }
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = var.aws_region
}
