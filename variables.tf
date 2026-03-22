################################################################################
# Miscellaneous variables
################################################################################

variable "env_name" {
  description = "Environment name string to be used for decisions and name generation"
  type        = string
}

variable "org" {
  description = "Organization name"
  type        = string
}

variable "name_prefix" {
  description = "String to use as prefix on object names"
  type        = string
}

variable "name_suffix" {
  description = "String to append to object names. This is optional, so start with dash if using."
  type        = string
  default     = ""
}

variable "region" {
  description = "AWS Region to target"
  type        = string
}

variable "source_repo" {
  description = "name of repo which holds this code"
  type        = string
}

# variable "logging_bucket" {
#   description = "Bucket used for centralized logging."
#   type        = string
# }