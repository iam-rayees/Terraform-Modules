resource "aws_route_table" "Public-RT-Terra" {
  vpc_id = aws_vpc.VPC-Terra.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.IGW-Terra.id
  }

  tags = {
    Name        = "${var.vpc_name}-public-RT"
    Owner       = local.Owner
    costcenter  = local.costcenter
    TeamDL      = local.TeamDL
    environment = var.environment

  }
}

resource "aws_route_table" "private-RT-Terra" {
  vpc_id = aws_vpc.VPC-Terra.id

    route {
      cidr_block     = "0.0.0.0/0"
      nat_gateway_id = var.Nat-GateWay_id
    }

  tags = {
    Name        = "${var.vpc_name}-private-RT"
    Owner       = local.Owner
    costcenter  = local.costcenter
    TeamDL      = local.TeamDL
    environment = var.environment

  }
}

resource "aws_route_table_association" "public-RTA" {
  count          = length(var.public_cidr_block)
  subnet_id      = element(aws_subnet.public-subnet[*].id, count.index)
  route_table_id = aws_route_table.Public-RT-Terra.id
}

resource "aws_route_table_association" "private-RTA" {
  count          = length(var.private_cidr_block)
  subnet_id      = element(aws_subnet.private-subnet[*].id, count.index)
  route_table_id = aws_route_table.private-RT-Terra.id
}
