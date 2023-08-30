######################### Generic ########################
variable "environment" {
  description = "Environment name"
  type        = string
}

variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "us-east-1"
}

variable "project_name" {
  description = "Project identity name"
  type        = string
}

###################### Network ##########################
variable "vpc_cidr" {
  description = "VPC IP range"
  type        = string
}

######################## ECR #########################
variable "ecr_repos" {
  description = "AWS ECR repositories"
  type        = list(string)
  default     = ["backend"]
}

variable "app_services" {
  type = list(string)
}
