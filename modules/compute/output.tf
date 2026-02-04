output "private-instance" {
  value = aws_instance.private-instance[*].id
}

output "public-instance" {
  value = aws_instance.public-instance[*].id
}

