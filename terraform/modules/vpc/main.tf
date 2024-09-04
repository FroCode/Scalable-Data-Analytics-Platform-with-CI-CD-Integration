module "vpc" {
  source          = "terraform-aws-modules/vpc/aws"
  version         = "~> 2.0"

  name            = var.vpc_name
  cidr            = var.vpc_cidr
  enable_nat_gateway = true
  public_subnets  = var.public_subnets
  private_subnets = var.private_subnets
  availability_zones = var.availability_zones

  tags = {
    Terraform = "true"
    Environment = "dev"
  }
}
