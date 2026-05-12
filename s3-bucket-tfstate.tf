################################################################################
# Terraform Remote State Amazon S3 Bucket
################################################################################

module "terraform_state" {
  source        = "git::https://github.com/fapd777/terraform-module-state-s3-bucket.git?ref=v20260508"
  name_prefix   = var.name_prefix
  name_suffix   = var.region
  log_bucket_id = var.logging_bucket
}