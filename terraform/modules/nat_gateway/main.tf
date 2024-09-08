resource "aws_eip" "nat" {
  count  = var.create_nat_gateway ? length(var.public_subnets) : 0
  domain = "vpc"  # Replaces vpc = true
}

resource "aws_nat_gateway" "nat" {
  count         = var.create_nat_gateway ? length(var.public_subnets) : 0
  allocation_id = aws_eip.nat[count.index].id
  subnet_id     = var.public_subnets[count.index]
  connectivity_type = "public"

  tags = {
    Name = "${var.name}-nat-gateway-${count.index}"
  }
}
