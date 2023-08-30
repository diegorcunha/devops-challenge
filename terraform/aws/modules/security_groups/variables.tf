
variable "region" {
  description = "AWS Region"
  default     = "us-east-1"
}

variable "name" {
  description = "AWS environment name"
  default     = ""
}

variable "environment" {
  description = "AWS environment"
  default     = ""
}


variable "vpc" {
  description = "name of vpc"

}

variable "private_subnets" {
  type = list(string)
}
variable "ingress_rules" {
  description = "List of ingress rules to create by name"
  type        = list(string)
  default     = []
}


variable "vpn_ingress_cidr_blocks" {
  description = "List of IPv4 CIDR ranges to use on all ingress rules"
  type        = list(string)
  default     = []
}
variable "create_vpn_connection_to_db_subnets" {
  description = "Whether to create vpn connection to db"
  type        = bool
  default     = true
}
variable "create_vpn_connection_to_private_subnets" {
  description = "Whether to create vpn connection to private"
  type        = bool
  default     = true
}