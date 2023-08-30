########################### Public ###########################
resource "aws_route_table" "public" {
  for_each = var.public_subnet_enable ? toset([var.public_rt_name]) : []

  vpc_id = aws_vpc.this[var.vpc_name].id

  tags = merge(
    {
      "Name" = format("%s", var.public_rt_name)
    },
    var.public_route_table_tags,
  )
}

resource "aws_route" "public" {
  for_each = var.create_igw && var.public_subnet_enable ? toset([var.public_rt_name]) : []

  route_table_id         = aws_route_table.public[var.public_rt_name].id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.this[var.igw_name].id

  timeouts {
    create = "3m"
  }
}

resource "aws_route_table_association" "public" {
  for_each = var.public_subnet_enable ? var.public_subnet_map : {}

  subnet_id      = aws_subnet.public[each.key].id
  route_table_id = aws_route_table.public[var.public_rt_name].id
}

################################## Private DMZ using NAT #######################################
resource "aws_route_table" "private_dmz" {
  for_each = var.private_dmz_subnet_enable ? toset([var.private_dmz_rt_name]) : []

  vpc_id = aws_vpc.this[var.vpc_name].id

  tags = merge(
    {
      "Name" = format("%s", var.private_dmz_rt_name)
    },
    var.private_dmz_route_table_tags,
  )
}

resource "aws_route" "private_dmz" {
  for_each = var.enable_nat_gateway && var.private_dmz_subnet_enable ? toset([var.private_dmz_rt_name]) : []

  route_table_id         = aws_route_table.private_dmz[var.private_dmz_rt_name].id
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = aws_nat_gateway.this[var.nat_eip_name].id

  timeouts {
    create = "3m"
  }
}

resource "aws_route_table_association" "private_dmz" {
  for_each = var.private_dmz_subnet_enable ? var.private_dmz_subnet_map : {}

  subnet_id      = aws_subnet.private_dmz[each.key].id
  route_table_id = aws_route_table.private_dmz[var.private_dmz_rt_name].id
}

################################### Private #########################################
resource "aws_route_table" "private" {
  for_each = var.private_subnet_enable ? toset([var.private_rt_name]) : []

  vpc_id = aws_vpc.this[var.vpc_name].id

  tags = merge(
    {
      "Name" = format("%s", var.private_rt_name)
    },
    var.private_route_table_tags,
  )
}

resource "aws_route_table_association" "private" {
  for_each = var.private_subnet_enable ? var.private_subnet_map : {}

  subnet_id      = aws_subnet.private[each.key].id
  route_table_id = aws_route_table.private[var.private_rt_name].id
}
