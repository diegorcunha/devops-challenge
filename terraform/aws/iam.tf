module "iam" {
  source   = "./modules/iam"
  app_name = "${var.project_name}-${var.environment}"
}
