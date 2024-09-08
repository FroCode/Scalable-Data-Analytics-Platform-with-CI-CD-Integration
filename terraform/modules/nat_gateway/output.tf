output "nat_gateway_ids" {
  description = "List of NAT Gateway IDs"
  value       = aws_nat_gateway.nat[*].id
}

output "nat_gateway_eips" {
  description = "List of NAT Gateway Elastic IPs"
  value       = aws_eip.nat[*].public_ip
}
