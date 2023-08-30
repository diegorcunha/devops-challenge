module "security_groups" {
  source                  = "./modules/security_groups"
  name                    = var.project_name
  environment             = var.environment
  vpc                     = module.main_network.vpc_id
  private_subnets         = module.main_network.private_subnets
}
