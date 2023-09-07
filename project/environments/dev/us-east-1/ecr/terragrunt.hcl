terraform {
  source = "../../../../modules//ecr/"  
}
include "root" {
  path = find_in_parent_folders()
}




inputs = {
    repo_name = "private-ecr"
    
  }
 

  