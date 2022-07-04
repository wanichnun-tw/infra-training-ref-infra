locals {
  team        = var.team_name
  stack       = "terralith"
  environment = var.environment
  name        = "${local.team}-${local.environment}-${local.stack}"
  tags = {
    team        = local.team
    stack       = local.stack
    environment = local.environment
  }
}
data "aws_availability_zones" "azs" {
}

module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "3.14.2"

  name = local.name
  cidr = "10.0.0.0/16"
  tags = merge(local.tags, {
    Name = local.name
  })

  azs            = data.aws_availability_zones.azs.names
  public_subnets = ["10.0.101.0/24", "10.0.102.0/24", "10.0.103.0/24"]
  public_subnet_tags = merge(local.tags, {
    Name = "${local.name}-public"
  })
}
