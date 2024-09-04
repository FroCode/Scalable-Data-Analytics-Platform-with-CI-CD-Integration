module "vpc" {
  source = "./vpc"
  # provide values for the variables
}

module "eks" {
  source = "./eks"
  cluster_name    = "my-cluster"
  cluster_version = "1.21"
  subnets         = module.vpc.private_subnets
  vpc_id           = module.vpc.vpc_id
  node_desired_capacity = 2
  node_max_capacity     = 3
  node_min_capacity     = 1
  node_instance_type    = "t3.medium"
}

module "airflow" {
  source = "./airflow"
  # provide values for the variables
}

module "kafka" {
  source = "./kafka"
  # provide values for the variables
}
