resource "aws_subnet" "public-subnet" {
  count             = length(var.public_subnet_cidr)
  vpc_id            = aws_vpc.VPC-Terra.id
  cidr_block        = element(var.public_subnet_cidr, count.index)
  availability_zone = element(var.az_name, count.index)

  tags = {
    Name        = "${var.vpc_name}-public-subnet-${count.index + 1}"
    Owner       = local.Owner
    costcenter  = local.costcenter
    TeamDL      = local.TeamDL
    environment = var.environment
  }
}
