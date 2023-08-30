variable "app_name" {
  type = string
}

variable "app_services" {
  type = list(string)
}

variable "region" {
  type = string
}

variable "ecs_task_execution_role_arn" {
  type = string
}

variable "vpc_id" {
  type = string
}

variable "private_subnets" {
  type = list(string)
}

variable "ecr_url" {
  
}

variable "environment"{}

variable "security_group" {
  
}
