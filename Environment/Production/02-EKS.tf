module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "19.15.1"

  cluster_name                   = "${var.project_name}-${var.environment}-cluster"
  cluster_version                = "1.30"
  cluster_endpoint_public_access = true

  vpc_id     = module.vpc.vpc_id
  subnet_ids = module.vpc.private_subnets
  control_plane_subnet_ids = module.vpc.intra_subnets

  cluster_addons = {
    coredns   = { most_recent = true }
    kube-proxy = { most_recent = true }
    vpc-cni   = { most_recent = true }
  }

  eks_managed_node_groups = var.eks_node_groups

  tags = {
    Project = var.project_name
    Env     = var.environment
  }
}
