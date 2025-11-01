region        = "us-east-1"
project_name  = "my-eks"
environment   = "staging"

vpc_cidr      = "10.1.0.0/16"
azs           = ["us-east-1a", "us-east-1b"]

public_subnets  = ["10.1.1.0/24", "10.1.2.0/24"]
private_subnets = ["10.1.3.0/24", "10.1.4.0/24"]
infra_subnets   = ["10.1.5.0/24", "10.1.6.0/24"]


eks_node_groups = {
  worker_nodes = {
    desired_size   = 3
    max_size       = 4
    min_size       = 2
    instance_types = ["t3.medium"]
    capacity_type  = "SPOT"
  }
}
