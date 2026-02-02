resource "aws_subnet" "private-subnet" {
  count             = length(var.private_subnet_cidr)
  vpc_id            = aws_vpc.VPC-Terra.id
  cidr_block        = element(var.private_subnet_cidr, count.index)
  availability_zone = element(var.az_name, count.index)

  tags = {
    Name        = "${var.vpc_name}-private-subnet-${count.index + 1}"
    Owner       = local.Owner
    costcenter  = local.costcenter
    TeamDL      = local.TeamDL
    environment = var.environment
  }
}
