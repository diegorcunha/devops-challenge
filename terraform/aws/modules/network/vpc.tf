resource "aws_vpc" "this" {
  for_each = toset([var.vpc_name])

  cidr_block           = var.vpc_cidr
  instance_tenancy     = var.instance_tenancy
  enable_dns_hostnames = var.enable_dns_hostnames
  enable_dns_support   = var.enable_dns_support

  tags = merge(
    {
      "Name" = format("%s", var.vpc_name)
    },
    var.vpc_tags
  )
}
