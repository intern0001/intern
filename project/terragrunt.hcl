# Configure Terragrunt to automatically store tfstate files in an S3 bucket
remote_state {
  backend = "s3"
  generate = {
    path      = "backend.tf"
    if_exists = "overwrite_terragrunt"
  }
  config = {
    bucket         = "intern-terragrunt-states-dev-backend"
    key            = "${path_relative_to_include()}/terraform.tfstate"
    region         = local.aws_region
    encrypt        = true
    dynamodb_table = "intern-terragrunt-states-dev-backend"
  }
}
# Generate an AWS provider block
generate "provider" {
  path      = "provider.tf"
  if_exists = "overwrite_terragrunt"
  contents  = <<EOF
provider "aws" {
  region = var.aws_region
  default_tags {
    tags = var.default_tags
  }
}

variable "aws_region" {
  description = "AWS Region."
}

variable "default_tags" {
  type        = map(string)
  description = "Default tags for AWS that will be attached to each resource."
}

EOF
}

locals {
  aws_region        = "us-east-1"
 
}


inputs = {
  aws_region        = local.aws_region
  default_tags = {
    "Environment"      = "Development",
  }
}