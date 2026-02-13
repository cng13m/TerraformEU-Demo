terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.10"
    }
  }

  required_version = ">= 1.5.0"
}

provider "aws" {
  region = var.region
}

