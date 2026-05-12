locals {
  common_tags = {
    Environment = var.env_name
    Developer   = var.developer
    Provisioner = var.provisioner
    SourceRepo  = var.source_repo
  }
}
