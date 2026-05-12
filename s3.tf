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
    status = "Enabled"
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

################################################################################
# S3 Bucket - Destination (us-west-2)
################################################################################

# resource "aws_s3_bucket" "destination" {
#   provider = aws.us-west-2
#   bucket   = "${var.org}-${var.name_prefix}-${var.env_name}-destination"
# }

# resource "aws_s3_bucket_public_access_block" "destination" {
#   provider = aws.us-west-2
#   bucket   = aws_s3_bucket.destination.id

#   block_public_acls       = true
#   block_public_policy     = true
#   ignore_public_acls      = true
#   restrict_public_buckets = true
# }

# resource "aws_s3_bucket_versioning" "destination" {
#   provider = aws.us-west-2
#   bucket   = aws_s3_bucket.destination.id

#   versioning_configuration {
#     status = "Enabled"
#   }
# }

# resource "aws_s3_bucket_lifecycle_configuration" "destination" {
#   provider = aws.us-west-2
#   bucket   = aws_s3_bucket.destination.id

#   rule {
#     id     = "expire-objects-after-90-days"
#     status = "Enabled"

#     filter {}

#     expiration {
#       days = 90
#     }
#   }
# }

################################################################################
# S3 Cross-Region Replication
################################################################################

# resource "aws_iam_role" "s3_crr" {
#   name = "${var.org}-${var.name_prefix}-${var.env_name}-s3-crr"

#   assume_role_policy = jsonencode({
#     Version = "2012-10-17"
#     Statement = [
#       {
#         Effect    = "Allow"
#         Principal = { Service = "s3.amazonaws.com" }
#         Action    = "sts:AssumeRole"
#       }
#     ]
#   })
# }

# resource "aws_iam_role_policy" "s3_crr" {
#   name = "${var.org}-${var.name_prefix}-${var.env_name}-s3-crr"
#   role = aws_iam_role.s3_crr.id

#   policy = jsonencode({
#     Version = "2012-10-17"
#     Statement = [
#       {
#         Effect = "Allow"
#         Action = [
#           "s3:GetReplicationConfiguration",
#           "s3:ListBucket"
#         ]
#         Resource = aws_s3_bucket.source.arn
#       },
#       {
#         Effect = "Allow"
#         Action = [
#           "s3:GetObjectVersionForReplication",
#           "s3:GetObjectVersionAcl",
#           "s3:GetObjectVersionTagging"
#         ]
#         Resource = "${aws_s3_bucket.source.arn}/*"
#       },
#       {
#         Effect = "Allow"
#         Action = [
#           "s3:ReplicateObject",
#           "s3:ReplicateDelete",
#           "s3:ReplicateTags"
#         ]
#         Resource = "${aws_s3_bucket.destination.arn}/*"
#       }
#     ]
#   })
# }

# resource "aws_s3_bucket_replication_configuration" "crr" {
#   bucket = aws_s3_bucket.source.id
#   role   = aws_iam_role.s3_crr.arn

#   rule {
#     id     = "replicate-all-objects"
#     status = "Enabled"

#     filter {}

#     destination {
#       bucket        = aws_s3_bucket.destination.arn
#       storage_class = "STANDARD"
#     }

#     delete_marker_replication {
#       status = "Enabled"
#     }
#   }

#   depends_on = [
#     aws_s3_bucket_versioning.source,
#     aws_s3_bucket_versioning.destination
#   ]
# }
