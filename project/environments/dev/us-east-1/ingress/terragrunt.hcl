terraform {
  source = "../../../../modules//ingress/"

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
inputs = {
 cluster_name     = dependency.eks.outputs.cluster_name
}
dependencies {
    paths = ["../eks/"]
}
  