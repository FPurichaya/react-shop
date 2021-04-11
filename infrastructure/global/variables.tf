variable "project_name" {
  type        = string
  default     = "project_name"
  description = "Enter the name of the project"
}

variable "environment" {
  type        = string
  default     = "dev"
  description = "Enter the environment of the project"
}

variable "private_subnets" {
  type        = list(any)
  default     = []
  description = "Enter the list of private subnets CIDRS"
}

variable "public_subnets" {
  type        = list(any)
  default     = []
  description = "Enter the list of public subnets CIDRS"
}

variable "region" {
  type        = string
  default     = "ap-southeast-1"
  description = "region that resources will be deployed"
}