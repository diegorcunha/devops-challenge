output "ecr_url" {
    value = toset([for v in aws_ecr_repository.backend : v.repository_url])
}
