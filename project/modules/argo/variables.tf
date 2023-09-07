variable "argo_version" {
    type = string
    default = "v2.8.0"
}
variable "updater_version" {
    type = string
    default = "v0.12.2"
  
}
variable "cluster_name" {  
    default = ""
}
variable "host" {
   default = "argocd.example.com"
}
variable "account_id" {
    default = ""
  
}

variable "argo_repo" {
  default = ""   
  
}

# variable "github_token" {
#   default     = "data.aws_ssm_parameter.github_token.value"
#   type        = string
#   sensitive   = true
# }

# variable "github_name" {
#   default     = "data.aws_ssm_parameter.github_name.value"
#   type        = string
#   sensitive   = true
# }
# variable "helm_repo" {
#     default = "https://github.com/Khachik001/helm"
#     type    = string

# } 

locals {
  github_name  = data.aws_ssm_parameter.github_name.value
  github_token = data.aws_ssm_parameter.github_token.value
}