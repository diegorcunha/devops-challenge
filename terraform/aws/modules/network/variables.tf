####################### General ########################
data "aws_availability_zones" "available" {
  state = "available"
}

####################### VPC ########################
variable "vpc_name" {
  description = "Name to be used as VPC identifier"
  type        = string
  default     = ""
}

variable "vpc_cidr" {
  description = "The CIDR block for the VPC"
  type        = string
  default     = ""
}

variable "instance_tenancy" {
  description = "A tenancy option for instances launched into the VPC"
  type        = string
  default     = "default"
}


variable "enable_dns_hostnames" {
  description = "Enable/Disable DNS hostnames in the VPC"
  type        = bool
  default     = true
}

variable "enable_dns_support" {
  description = "Enable/Disable DNS support in the VPC"
  type        = bool
  default     = true
}

variable "vpc_tags" {
  description = "Tags suitable for the VPC"
  type        = map(string)
  default     = {}
}

####################### Gateways ########################
variable "create_igw" {
  description = "Enable/Disable Internet Gateway"
  type        = bool
  default     = true
}

variable "igw_name" {
  description = "Name to be used as IGW identifier"
  type        = string
  default     = ""
}

variable "igw_tags" {
  description = "Tags suitable for Internet Gateway"
  type        = map(string)
  default     = {}
}

variable "enable_nat_gateway" {
  description = "Enable/Disable NAT Gateway"
  type        = bool
  default     = true
}

variable "nat_gateway_name" {
  description = "Name to be used as NAT identifier"
  type        = string
  default     = ""
}

variable "nat_gateway_tags" {
  description = "Tags suitable for NAT Gateway"
  type        = map(string)
  default     = {}
}

variable "nat_eip_name" {
  description = "Name to be used as Elastic IP identifier"
  type        = string
  default     = ""
}

variable "nat_eip_tags" {
  description = "Tags suitable for Elastic IP"
  type        = map(string)
  default     = {}
}
####################### Subnets ########################
variable "public_subnet_map" {
  description = "Public Subnets AZ map inside the VPC"
  type        = map(string)
  default     = {}
}

variable "public_subnet_enable" {
  description = "Public Subnets Enable/Disable"
  type        = bool
  default     = true
}

variable "map_public_ip_on_launch" {
  description = "Enable/Disable public IP on EC2 creation"
  type        = bool
  default     = true
}

variable "public_subnet_suffix" {
  description = "Public Subnets Name suffix"
  type        = string
  default     = ""
}

variable "public_subnet_name" {
  description = "Public Subnets Name Tag"
  type        = string
  default     = ""
}

variable "public_subnet_tags" {
  description = "Public Subnets Tags"
  type        = map(string)
  default     = {}
}
####
variable "private_dmz_subnet_map" {
  description = "Private DMZ Subnets AZ map"
  type        = map(string)
  default     = {}
}

variable "private_dmz_subnet_enable" {
  description = "Private DMZ Subnets Enable/Disable"
  type        = bool
  default     = true
}

variable "private_dmz_subnet_suffix" {
  description = "Private DMZ Subnets Name suffix"
  type        = string
  default     = ""
}

variable "private_dmz_subnet_name" {
  description = "Private DMZ Subnets Name Tag"
  type        = string
  default     = ""
}

variable "private_dmz_subnet_tags" {
  description = "Private DMZ Subnets Tags"
  type        = map(string)
  default     = {}
}
###
variable "private_subnet_map" {
  description = "Private Subnets AZ map"
  type        = map(string)
  default     = {}
}

variable "private_subnet_enable" {
  description = "Private Subnets Enable/Disable"
  type        = bool
  default     = true
}

variable "private_subnet_suffix" {
  description = "Private Subnets Name suffix"
  type        = string
  default     = ""
}

variable "private_subnet_name" {
  description = "Private Subnets Name Tag"
  type        = string
  default     = ""
}

variable "private_subnet_tags" {
  description = "Private Subnets Tags"
  type        = map(string)
  default     = {}
}

variable "db_subnet_group_name" {
  description = "DB subnet group Name"
  type        = string
}

variable "create_database_subnet_group" {
  description = "Enable/Disable DB subnet group"
  type        = bool
  default     = true
}

variable "database_subnet_group_tags" {
  description = "DB subnet group Tags"
  type        = map(string)
  default     = {}
}

####################### Routes ########################
variable "public_rt_name" {
  description = "Enable/Disable Public Route Table creation"
  type        = string
  default     = ""
}

variable "public_route_table_tags" {
  description = "Public Route Table Tags"
  type        = map(string)
  default     = {}
}

variable "private_dmz_rt_name" {
  description = "Enable/Disable Private DMZ Route Table creation"
  type        = string
  default     = ""
}

variable "private_dmz_route_table_tags" {
  description = "Private DMZ Route Table Tags"
  type        = map(string)
  default     = {}
}

variable "private_rt_name" {
  description = "Enable/Disable Private Route Table creation"
  type        = string
  default     = ""
}

variable "private_route_table_tags" {
  description = "Private Route Table Tags"
  type        = map(string)
  default     = {}
}































