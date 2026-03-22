# These outputs display information to the terminal
output "account_id" {
  description = "Account which terraform was run on"
  value       = data.aws_caller_identity.current.account_id
}

output "common_tags" {
  description = "tags which should be applied to all taggable objects"
  value       = local.common_tags
}

output "org" {
  description = "string to prepend to resource name - optional"
  value       = var.org
}

output "name_prefix" {
  description = "string to prepend to all resource names"
  value       = var.name_prefix
}

output "env_name" {
  description = "string to append to all resource names"
  value       = var.env_name
}

output "region" {
  description = "region being used"
  value       = var.region
}