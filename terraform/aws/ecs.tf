module "ecs" {
  source                      = "./modules/ecs"
  app_name                    = var.project_name
  app_services                = var.app_services
  region                      = var.aws_region
  ecs_task_execution_role_arn = module.iam.ecs_task_execution_role_arn
  vpc_id                      = module.main_network.vpc_id
  private_subnets             = module.main_network.private_subnets
  ecr_url                     = module.ecr.ecr_url
  environment                 = var.environment
  security_group              = module.security_groups.ecs_security_group_id
}
