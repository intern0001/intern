terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.10.0"
    }
  }
}
data "aws_availability_zones" "azs" {}
module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "5.1.1"

  name = var.vpc_name
  cidr = var.vpc_cidr

  azs             = data.aws_availability_zones.azs.names
  private_subnets = slice(cidrsubnets(var.vpc_cidr, 8, 8, 8, 8), 0, 2)
  public_subnets  = slice(cidrsubnets(var.vpc_cidr, 8, 8, 8, 8), 2, 4)

# Single NAT Gateway
  enable_nat_gateway = true
  single_nat_gateway = true
  one_nat_gateway_per_az = false
###################################
  enable_dns_hostnames = true
  enable_dns_support = true

}