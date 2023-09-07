terraform {
  source = "../../../../modules//eks/"  
}
include "root" {
  path = find_in_parent_folders()
}
dependency "vpc" {
  config_path                             = "../vpc/"
  mock_outputs_allowed_terraform_commands = ["init", "validate", "plan"] # Configure mock outputs for the "init", "validate", "plan" commands that are returned when there are no outputs available (e.g the module hasn't been applied yet.)
  mock_outputs = {
  vpc_id = "vpc-fake-id"
  private_subnets = "fake-subnets"
  }
}
locals {
  # Load environment-wide variables
//   environment_vars = read_terragrunt_config(find_in_parent_folders("env.hcl"))
//   # Extract needed variables for reuse
//   name                  = local.environment_vars.locals.cluster_name
//   max_size              = local.environment_vars.locals.max_size
//   min_size              = local.environment_vars.locals.min_size
//   desired_size          = local.environment_vars.locals.desired_size
//   instance_type         = local.environment_vars.locals.instance_types
//   aws_region            = local.environment_vars.locals.aws_region 
//   k8s_config            = local.environment_vars.locals.k8s_config
  
}
inputs = {

   vpc_id = dependency.vpc.outputs.vpc_id
   private_subnets = dependency.vpc.outputs.private_subnets
  }
 



dependencies {
    paths = ["../vpc/"]
}
  