terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.36.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "ap-southeast-1"
}

terraform {
  backend "s3" {
    bucket         = "testinfbucket"
    key            = "infrastructure/dev/terraform.tfstate"
    region         = "ap-southeast-1"
    dynamodb_table = "testinfbucket"
  }
}