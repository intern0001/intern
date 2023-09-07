variable "vpc_id" {
}
variable "private_subnets" {
  type = list(string) 
}
variable "min_size" {
    description = "Minimum size of the worker node."
    type = number
    default = 2
}
variable "max_size" {
    description = "Maximum size of the worker node."
    type = number
    default = 3
}
variable "desired_size" {
     description = "Desired size of the worker node."
    type = number
    default = 2
  
}
variable "cluster_name" {
  description = "Name of the EKS Cluster. Must be between 1-100 characters in length. Must begin with an alphanumeric character, and must only contain alphanumeric characters, dashes and underscores (^[0-9A-Za-z][A-Za-z0-9-_]+$)."
  type        = string
  default = "intern_eks"
}
variable "instance_types" {
  description = "List of instance types associated with the EKS Node Group."
  type        = list(string)
  default     = ["t3.small"]

}
