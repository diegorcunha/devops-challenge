resource "aws_subnet" "public" {
  for_each = var.public_subnet_enable ? var.public_subnet_map : {}

  vpc_id                  = aws_vpc.this[var.vpc_name].id
  cidr_block              = cidrsubnet(aws_vpc.this[var.vpc_name].cidr_block, 6, each.value)
  availability_zone       = length(regexall("^[a-z]{2}-", each.key)) > 0 ? each.key : null
  map_public_ip_on_launch = var.map_public_ip_on_launch


  tags = merge(
    {
      "Name" = format(
        "%s-%s-%s",
        var.public_subnet_name,
        each.key,
        var.public_subnet_suffix
      )
    },
    var.public_subnet_tags
  )
}

resource "aws_subnet" "private_dmz" {
  for_each = var.private_dmz_subnet_enable ? var.private_dmz_subnet_map : {}

  vpc_id            = aws_vpc.this[var.vpc_name].id
  cidr_block        = cidrsubnet(aws_vpc.this[var.vpc_name].cidr_block, 6, each.value)
  availability_zone = length(regexall("^[a-z]{2}-", each.key)) > 0 ? each.key : null


  tags = merge(
    {
      "Name" = format(
        "%s-%s-%s",
        var.private_dmz_subnet_name,
        each.key,
        var.private_dmz_subnet_suffix
      )
    },
    var.private_dmz_subnet_tags
  )
}

resource "aws_subnet" "private" {
  for_each = var.private_subnet_enable ? var.private_subnet_map : {}

  vpc_id            = aws_vpc.this[var.vpc_name].id
  cidr_block        = cidrsubnet(aws_vpc.this[var.vpc_name].cidr_block, 6, each.value)
  availability_zone = length(regexall("^[a-z]{2}-", each.key)) > 0 ? each.key : null


  tags = merge(
    {
      "Name" = format(
        "%s-%s-%s",
        var.private_subnet_name,
        each.key,
        var.private_subnet_suffix
      )
    },
    var.private_subnet_tags
  )
}

resource "aws_db_subnet_group" "db" {
  for_each = var.create_database_subnet_group ? toset([var.db_subnet_group_name]) : []

  name        = lower(var.db_subnet_group_name)
  description = "Database subnet group - ${var.db_subnet_group_name}"
  subnet_ids  = toset([for v in aws_subnet.private : v.id])
  tags = merge(
    {
      "Name" = format("%s", var.db_subnet_group_name)
    },
    var.database_subnet_group_tags,
  )
}
