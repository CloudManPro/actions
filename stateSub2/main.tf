terraform {
  backend "s3" {
    bucket = "s3-cloudman1-backend-test"
    region = "us-east-1"
  }
}

provider "aws" { region = "us-east-1" }

data "aws_vpc" "selected" {
  filter {
    name   = "tag:Name"
    values = ["main-vpc"]
  }
}

resource "aws_subnet" "sub2" {
  vpc_id     = data.aws_vpc.selected.id
  cidr_block = "10.1.2.0/24"
  tags       = { Name = "subnet-2" }
}
