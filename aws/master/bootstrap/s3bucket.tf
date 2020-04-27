# Create an S3 bucket for storing shared state
module "shared_state" {
  source = "terraform-aws-modules/s3-bucket/aws"
  bucket = "shared-state"

  acl                     = "private"
  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "aws:kms"
      }
    }
  }

  versioning = {
    enabled = true
  }
}
