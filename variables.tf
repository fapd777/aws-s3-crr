################################################################################
# Miscellaneous variables
################################################################################

variable "developer" {
  description = "Developer email"
  type        = string
}

variable "env_name" {
  description = "Environment name string to be used for decisions and name generation"
  type        = string
}

variable "name_prefix" {
  description = "String to use as prefix on object names"
  type        = string
}

variable "org" {
  description = "Organization name"
  type        = string
}

variable "provisioner" {
  description = "Infrastructure provisioning method"
  type        = string
}

variable "region" {
  description = "AWS Region to target"
  type        = string
}

variable "source_repo" {
  description = "name of repo which holds this code"
  type        = string
}