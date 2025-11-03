# Multi-Environment AWS EKS Infrastructure with Terraform

This project provisions a **highly available, multi-environment AWS Elastic Kubernetes Service (EKS) cluster** using official Terraform Registry modules for **VPC** and **EKS**.

It follows a clean multi-environment structure (`dev`, `staging`, `prod`), where each environment has its own:
- **Backend configuration** for separate state management  
- **Variables**  
- **VPC Network and EKS definitions**  

## Overview

The project provisions:
- A **VPC** with 3 subnet tiers across **2 Availability Zones**:
  - **Public Subnets:** Host public-facing components like load balancers.
  - **Private Subnets:** Host EKS worker nodes with NAT Gateway internet access.
  - **Intra Subnets:** Host the **EKS control plane**, **fully isolated** from the internet.
- A **secure and scalable EKS cluster**, with control plane and worker nodes distributed for high availability.

All components are built using official Terraform AWS modules:
- 🧱 [terraform-aws-modules/vpc/aws](https://registry.terraform.io/modules/terraform-aws-modules/vpc/aws)
- ☸️ [terraform-aws-modules/eks/aws](https://registry.terraform.io/modules/terraform-aws-modules/eks/aws)

---

## Architecture

<img width="1381" height="631" alt="TerraformVPCEKS drawio" src="https://github.com/user-attachments/assets/6c2bbc67-17cc-4b6b-a8e1-25a5e5ef5c40" />



Each environment replicates this structure independently, ensuring **isolation and reliability**.

---

## Prerequisites

### 1️⃣ Install Terraform
Follow the official guide:  
👉 [https://developer.hashicorp.com/terraform/downloads](https://developer.hashicorp.com/terraform/downloads)

Verify installation: terraform -v


2️⃣ Configure **AWS** **CLI** Provide:

Access Key ID

Secret Access Key

Default region (e.g., us-east-1)

Output format (json)

Each environment folder contains its own:

backend.tf → Defines the remote backend for that environment.

variables.tf → Defines variable inputs.

*.tfvars → Contains environment-specific values.

eks.tf / vpc.tf → Infrastructure logic for **EKS** and **VPC** setup.


### Usage Guide

1️⃣ Initialize the Environment

Move into the desired environment folder:

cd Environment/Dev terraform init

💡 Each environment must be initialized separately to use its unique backend and state file.


2️⃣ Validate the Configuration

Run:

terraform validate


3️⃣ Plan the Deployment

terraform plan -var-file=05-Dev.tfvars

This generates an execution plan using that environment’s variable file.


4️⃣ Apply the Infrastructure

Deploy the environment:

terraform apply -var-file=05-Dev.tfvars

Confirm with yes when prompted.

Terraform will:

Create the **VPC** and subnets.

Configure **NAT** gateways.

Deploy **EKS** control plane and worker nodes.

5️⃣ Destroy the Environment

To remove all infrastructure for a specific environment:

terraform destroy -var-file=05-Dev.tfvars


🔒 Backend Configuration

Each environment has its own remote backend configuration in backend.tf

This ensures:

Isolated state management (Dev, Staging, Production)

Safe parallel operations without interference

Versioned and encrypted state files


🧠 Best Practices

Always cd into the environment directory before running terraform init.

Never share state files between environments.

Before initializing Terraform, ensure the S3 bucket and DynamoDB table for the remote backend already exist.

Use **IAM** User/roles with least privileges for Terraform execution.

Keep your state backend (S3/DynamoDB) properly secured.

Use terraform fmt and terraform validate before commits.

Prefer remote backends over local state storage for safety.


✅ Conclusion

This Terraform project provides:

Modular, production-ready **AWS** **EKS** infrastructure

Full environment isolation and secure networking

Automated state management with separate backends

By following this structure, you can deploy and manage Dev, Staging, and Production Kubernetes clusters with ease, reliability, and scalability.

Author: Osung 

Tools Used: Terraform, **AWS** **CLI**, **AWS** **EKS**, **AWS** **VPC**
