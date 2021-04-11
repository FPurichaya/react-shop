locals {
  aws_region_azs = formatlist("%s%s", var.region, ["a", "b", "c"])
}


module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "2.77.0"

  name = "test-vpc"
  cidr = "10.0.0.0/16"

  azs             = local.aws_region_azs
  private_subnets = var.private_subnets
  public_subnets  = var.public_subnets

  enable_nat_gateway   = true
  single_nat_gateway   = true
  enable_dns_support   = true
  enable_dns_hostnames = true
  enable_s3_endpoint   = true

  tags = {
    Terraform    = "true"
    Environment  = var.environment
    Project_name = var.project_name
  }
}