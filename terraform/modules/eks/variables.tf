variable "cluster_name" {
  description = "The name of the EKS cluster"
  type        = string
}

variable "cluster_version" {
  description = "The Kubernetes version for the EKS cluster"
  type        = string
}

variable "subnets" {
  description = "A list of subnets for the EKS cluster"
  type        = list(string)
}

variable "vpc_id" {
  description = "The ID of the VPC"
  type        = string
}

variable "node_desired_capacity" {
  description = "The desired capacity of the node group"
  type        = number
}

variable "node_max_capacity" {
  description = "The maximum capacity of the node group"
  type        = number
}

variable "node_min_capacity" {
  description = "The minimum capacity of the node group"
  type        = number
}

variable "node_instance_type" {
  description = "The instance type for the node group"
  type        = string
}
