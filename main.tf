terraform {
  required_version = ">= 1.3.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = "ap-south-1"
}

# ✅ EKS Module
module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "20.24.2"

  cluster_name    = "anjli-eks-cluster"
  cluster_version = "1.26"

  vpc_id = var.vpc_id

  subnet_ids = var.private_subnet_ids

  # ✅ Enable public access to cluster
  cluster_endpoint_public_access = true

  # ✅ Managed Node Group
  eks_managed_node_groups = {
    default = {
      instance_types = ["t3.medium"]

      min_size     = 1
      max_size     = 2
      desired_size = 1
    }
  }
}
