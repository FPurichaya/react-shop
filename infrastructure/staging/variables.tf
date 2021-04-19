variable "region" {
  type    = string
  default = "ap-southeast-1"
}

variable "project" {
  default = "jpreact-shop"
}

variable "environment" {
  type        = string
  description = "Provide the name of the stage eg:dev, stage, QA etc..."
  default     = "dev"
}

variable "docdb_master_user" {
  type    = string
  default = "master"
}

variable "docdb_master_password" {
  type    = string
  default = "12345678"
}