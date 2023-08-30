resource "aws_ecr_repository" "backend" {
  for_each = toset(var.ecr_repos)

  name = format("%s-ecr-%s", var.name_prefix, each.value)
  image_scanning_configuration {
    scan_on_push = true
  }
}
