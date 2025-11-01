region        = "us-east-1"
project_name  = "my-eks"
environment   = "prod"

vpc_cidr      = "10.2.0.0/16"
azs           = ["us-east-1a", "us-east-1b", "us-east-1c"]

public_subnets  = ["10.2.1.0/24", "10.2.2.0/24", "10.2.3.0/24"]
private_subnets = ["10.2.4.0/24", "10.2.5.0/24", "10.2.6.0/24"]
infra_subnets   = ["10.2.7.0/24", "10.2.8.0/24", "10.2.9.0/24"]


eks_node_groups = {
  worker_nodes = {
    desired_size   = 4
    max_size       = 6
    min_size       = 3
    instance_types = ["t3.large"]
    capacity_type  = "ON_DEMAND"
  }
}
