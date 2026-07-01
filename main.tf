provider "aws" {
  region = "ap-south-1"
}

module "eks" {
  source          = "terraform-aws-modules/eks/aws"
  version         = "~> 19.0"

  cluster_name    = "anjli-eks-cluster"
  cluster_version = "1.29"

  vpc_id     = "your-vpc-id"
  subnet_ids = ["subnet-1", "subnet-2"]

  eks_managed_node_groups = {
    default = {
      desired_size = 1
      max_size     = 2
      min_size     = 1

      instance_types = ["t3.medium"]
    }
  }
}
