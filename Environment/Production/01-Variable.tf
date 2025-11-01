variable "region" {
  description = "AWS region"
  type        = string
}

variable "project_name" {
  description = "Project name"
  type        = string
}

variable "environment" {
  description = "Environment (dev, staging, prod)"
  type        = string
}

variable "vpc_cidr" {
  description = "VPC CIDR"
  type        = string
}

variable "azs" {
  description = "Availability zones"
  type        = list(string)
}

variable "public_subnets" {
  description = "Public subnets CIDRs"
  type        = list(string)
}

variable "private_subnets" {
  description = "Private subnets CIDRs"
  type        = list(string)
}

variable "infra_subnets" {
  description = "Infra subnets CIDRs for control plane"
  type        = list(string)
}


variable "eks_node_groups" {
  description = "Node group configuration"
  type        = map(any)
}
