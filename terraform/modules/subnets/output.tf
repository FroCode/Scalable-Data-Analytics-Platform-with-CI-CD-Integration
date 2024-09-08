output "private_subnets" {
  description = "IDs of private subnets"
  value       = aws_subnet.private[*].id
}

output "public_subnets" {
  description = "IDs of public subnets"
  value       = aws_subnet.public[*].id
}
output "public_subnet_ids" {
  value = aws_subnet.public[*].id
}
