variable "vpc_cidr" {
  description = "The CIDR block for the main AWS VPC that will be created."
  type    = string
  default = "10.10.0.0/16"
}
variable "vpc_name" {
    type = string
    default = "intern_vpc"
}
