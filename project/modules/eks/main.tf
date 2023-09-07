terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.10.0"
    }
  }
}
module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "19.16.0"

  cluster_name    = var.cluster_name
  cluster_version = "1.27"

  
  cluster_endpoint_public_access  = true

   vpc_id = var.vpc_id
   subnet_ids = var.private_subnets

   enable_irsa = true
   
 eks_managed_node_groups = {
  
    general = {
      min_size     = var.min_size
      max_size     = var.max_size
      desired_size = var.desired_size

      instance_types =  var.instance_types
      capacity_type  = "SPOT"
    }
  }

 

}