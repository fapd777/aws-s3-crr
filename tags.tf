locals {
  common_tags = {
    Environment = var.env_name
    Developer   = "fpedraza@solvd.com"
    Provisioner = "Terraform"
    SourceRepo  = var.source_repo
  }
}
