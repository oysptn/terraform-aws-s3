variable "environment" {
  type = string
}

variable "region" {
  type = string
}

variable "region_code" {
  type = string
}

variable "prefix" {
  type = string
  default = "ptn"
}

variable "project" {
  type = string
}

variable "create_private_bucket" {
  description = "Create private bucket"
  type        = bool
  default     = false
}

variable "tags" {
  description = "(Optional) A mapping of tags to assign to the bucket."
  type        = map(string)
  default     = {}
}

variable "force_destroy" {
  description = "True or False"
  type = bool
  default = false
}





