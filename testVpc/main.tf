terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }

  backend "s3" {
    bucket = "s3-cloudman1-backend-test"
    # A 'key' será injetada via linha de comando no GitHub Action
    region = "us-east-1"
  }
}

provider "aws" {
  region = "us-east-1"
}

resource "aws_vpc" "main" {
  cidr_block = "10.1.0.0/16"

  tags = {
    Name = "test-action"
  }
}
