module "vpc" {
  source               = "terraform-aws-modules/vpc/aws"
  enable_dns_hostnames = true
  enable_dns_support   = true
  tags                 = var.tags
  name                 = "${var.tags.service}-${var.tags.env}"
  cidr                 = var.vpc_cidr
}
