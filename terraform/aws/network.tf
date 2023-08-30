module "main_network" {
  source = "./modules/network"

  vpc_name         = "${local.name_prefix}-${var.aws_region}-main"
  vpc_cidr         = var.vpc_cidr
  igw_name         = "${local.name_prefix}-main"
  nat_gateway_name = "${local.name_prefix}-main"
  nat_eip_name     = "${local.name_prefix}-main"

  public_subnet_map = {
    "${var.aws_region}a" = 1,
    "${var.aws_region}b" = 2,
    "${var.aws_region}c" = 3,
  }

  public_subnet_name   = local.name_prefix
  public_subnet_suffix = "pub-main"

  private_dmz_subnet_map = {
    "${var.aws_region}a" = 4,
    "${var.aws_region}b" = 5,
    "${var.aws_region}c" = 6,
  }

  private_dmz_subnet_name   = local.name_prefix
  private_dmz_subnet_suffix = "pvt-dmz-main"

  private_subnet_map = {
    "${var.aws_region}a" = 7,
    "${var.aws_region}b" = 8,
    "${var.aws_region}c" = 9,
  }

  private_subnet_name   = local.name_prefix
  private_subnet_suffix = "pvt-main"

  public_rt_name      = "${local.name_prefix}-pub"
  private_dmz_rt_name = "${local.name_prefix}-pvt-dmz"
  private_rt_name     = "${local.name_prefix}-pvt"

  db_subnet_group_name = "${local.name_prefix}-db-subnet-group"
}

resource "aws_route53_zone" "this" {
  name = "${var.environment}.${local.domain_name}"
}
