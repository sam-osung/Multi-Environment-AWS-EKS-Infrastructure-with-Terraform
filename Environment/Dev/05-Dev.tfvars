region        = "us-east-1"
project_name  = "my-eks"
environment   = "dev"

vpc_cidr      = "10.0.0.0/16"
azs           = ["us-east-1a", "us-east-1b"]

public_subnets  = ["10.0.1.0/24", "10.0.2.0/24"]
private_subnets = ["10.0.3.0/24", "10.0.4.0/24"]
infra_subnets   = ["10.0.5.0/24", "10.0.6.0/24"]


eks_node_groups = {
  worker_nodes = {
    desired_size   = 2
    max_size       = 3
    min_size       = 1
    instance_types = ["t3.small"]
    capacity_type  = "SPOT"
  }
}