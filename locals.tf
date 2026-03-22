# Remove this file after the s3 bucket for remote state is created

locals {
  s3_terraform_state_key = "${var.org}-${var.name_prefix}-${var.env_name}-remote-state-backend.tfstate"
}

