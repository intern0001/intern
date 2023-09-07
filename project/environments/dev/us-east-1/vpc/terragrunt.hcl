terraform {
  source = "../../../../modules//vpc/"  
}

include "root" {
  path = find_in_parent_folders()
}

locals {
  # Load environment-wide variables
  
  # Extract needed variables for reuse
}

inputs = {
  
}