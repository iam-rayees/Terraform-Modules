# These will be used while modules are importing to development and production environments.

output "vpc_name" {
  value = var.vpc_name
}

output "vpc_id" {
  value = aws_vpc.VPC-Terra.id
}

output "environment" {
  value = var.environment
}

output "public-subnet" {
  value = aws_subnet.public-subnet[*].id
}

output "private-subnet" {
  value = aws_subnet.private-subnet[*].id
}

output "public_route_table_id" {
  value = aws_route_table.Public-RT-Terra.id
}

output "private_route_table_id" {
  value = aws_route_table.private-RT-Terra.id
}
