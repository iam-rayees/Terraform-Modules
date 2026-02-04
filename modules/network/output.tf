output "vpc_id" {
  value = aws_vpc.VPC-Terra.id
}

output "environment" {
  value = var.environment
}

output "vpc_name" {
  value = var.vpc_name
}

output "public_subnet_id_1" {
  value = aws_subnet.public-subnet[0].id
}

output "public_subnet_id" {
  value = aws_subnet.public-subnet[*].id
}

output "private_subnet_id" {
  value = aws_subnet.private-subnet[*].id
}
