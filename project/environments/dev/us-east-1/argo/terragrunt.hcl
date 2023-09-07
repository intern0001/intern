terraform {
  source = "../../../../modules//argo/"  
}
include "root" {
  path = find_in_parent_folders()
}
dependency "eks" {
  config_path                             = "../eks/"
  mock_outputs_allowed_terraform_commands = ["init", "validate", "plan"] # Configure mock outputs for the "init", "validate", "plan" commands that are returned when there are no outputs available (e.g the module hasn't been applied yet.)
  mock_outputs = {
  cluster_name     = "fake-cluster_name "
  }
}
locals {
  # Load environment-wide variables
  environment_vars = read_terragrunt_config(find_in_parent_folders("env.hcl"))
  # Extract needed variables for reuse
  host             = local.environment_vars.locals.host
  account_id       = local.environment_vars.locals.account_id
  argo_repo        = local.environment_vars.locals.argo_repo  
}




inputs = {
    argo_version="v2.8.0"
    cluster_name     = dependency.eks.outputs.cluster_name
    host             = local.host
    account_id       = local.account_id
    argo_repo        = local.argo_repo
    
  }
 



dependencies {
    paths = ["../ingress/"]
}
  