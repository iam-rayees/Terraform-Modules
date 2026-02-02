# It will be used by development and production environments

output "sg_id" {
  value = aws_security_group.allow_all.id
}

 