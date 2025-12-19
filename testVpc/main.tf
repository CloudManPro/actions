terraform {
  backend "s3" {
    bucket = "s3-cloudman1-backend-test"
    region = "us-east-1"
  }
}

provider "aws" { region = "us-east-1" }

resource "aws_vpc" "main" {
  cidr_block = "10.1.0.0/16"
  tags = { Name = "main-vpc" }
}
