output "vpc_id" {
  description = "The ID of the VPC"
  value       = aws_vpc.this[var.vpc_name].id
}

output "vpc_arn" {
  description = "The ARN of the VPC"
  value       = aws_vpc.this[var.vpc_name].arn
}

output "vpc_cidr_block" {
  description = "The CIDR block of the VPC"
  value       = aws_vpc.this[var.vpc_name].cidr_block
}

output "db_subnet_group_name" {
  description = "DB Subnet Group ID"
  value       = aws_db_subnet_group.db[var.db_subnet_group_name].name
}

output "private_dmz_subnets" {
  description = "List of Private DMZ Subnets"
  value       = toset([for v in aws_subnet.private_dmz : v.id])
}

output "private_subnets" {
  description = "List of Private Subnets"
  value       = toset([for v in aws_subnet.private : v.id])
}

output "public_subnets" {
  description = "List of Public Subnets"
  value       = toset([for v in aws_subnet.public : v.id])
}
