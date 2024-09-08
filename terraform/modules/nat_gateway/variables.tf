variable "public_subnets" {
  description = "List of public subnet IDs where NAT Gateways will be created"
  type        = list(string)
}

variable "create_nat_gateway" {
  description = "Flag to create NAT Gateways"
  type        = bool
  default     = true
}

variable "name" {
  description = "Name prefix for the NAT Gateways"
  type        = string
}
