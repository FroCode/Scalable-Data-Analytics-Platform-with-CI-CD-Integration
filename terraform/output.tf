output "vpc_id" {
  description = "The VPC ID"
  value       = aws_vpc.main_vpc.id
}

output "public_subnet_id" {
  description = "The public subnet ID"
  value       = aws_subnet.public_subnet.id
}

output "private_subnet_id" {
  description = "The private subnet ID"
  value       = aws_subnet.private_subnet.id
}

output "igw_id" {
  description = "The Internet Gateway ID"
  value       = aws_internet_gateway.igw.id
}

output "nat_gateway_id" {
  description = "The NAT Gateway ID"
  value       = aws_nat_gateway.nat_gateway.id
}
