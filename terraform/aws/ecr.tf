module "ecr" {
    source = "./modules/ecr"
    ecr_repos = var.ecr_repos
    name_prefix = local.name_prefix
}
