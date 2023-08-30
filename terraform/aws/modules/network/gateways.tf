resource "aws_internet_gateway" "this" {
  for_each = var.create_igw ? toset([var.igw_name]) : []

  vpc_id = aws_vpc.this[var.vpc_name].id

  tags = merge(
    {
      "Name" = format("%s", var.igw_name)
    },
    var.igw_tags
  )
}

resource "aws_eip" "nat" {
  for_each = var.enable_nat_gateway ? toset([var.nat_eip_name]) : []

  vpc = true

  tags = merge(
    {
      "Name" = format("%s", var.nat_eip_name)
    },
    var.nat_eip_tags,
  )
}

resource "aws_nat_gateway" "this" {
  for_each = var.enable_nat_gateway ? toset([var.nat_gateway_name]) : []

  allocation_id = aws_eip.nat[var.nat_eip_name].id
  subnet_id     = aws_subnet.public[data.aws_availability_zones.available.names[0]].id

  tags = merge(
    {
      "Name" = format("%s", var.nat_gateway_name)
    },
    var.nat_gateway_tags,
  )

  depends_on = [aws_internet_gateway.this]
}
