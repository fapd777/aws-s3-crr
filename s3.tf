################################################################################
# S3 Bucket - Source (us-east-2)
################################################################################

resource "aws_s3_bucket" "source" {
  bucket = "${var.org}-${var.name_prefix}-${var.env_name}-source"
}

resource "aws_s3_bucket_public_access_block" "source" {
  bucket = aws_s3_bucket.source.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

resource "aws_s3_bucket_versioning" "source" {
  bucket = aws_s3_bucket.source.id

  versioning_configuration {
    status = "Disabled"
  }
}

resource "aws_s3_bucket_lifecycle_configuration" "source" {
  bucket = aws_s3_bucket.source.id

  rule {
    id     = "expire-objects-after-90-days"
    status = "Enabled"

    filter {}

    expiration {
      days = 90
    }
  }
}
