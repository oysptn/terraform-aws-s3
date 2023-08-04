variable "environment" {
  type = string
}

variable "project" {
  type = string
}

variable "region" {
  type = string
}

variable "region_code" {
  type = string
}

# s3 
variable "create_private_bucket" {
  type = bool
  default = true
}

variable "force_destroy" {
  type = bool
  default = false
}


