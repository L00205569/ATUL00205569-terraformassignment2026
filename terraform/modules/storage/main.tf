resource "aws_s3_bucket" "this" {
  bucket = var.bucket_name
  tags = {
    Name        = var.bucket_name
    Owner       = var.owner
    Sovereignty = "IE"
  }
}

# Gated by s3_encryption_enabled.
# false → no SSE config in the plan → s3_encryption_ok and bucket_has_encryption fail.
resource "aws_s3_bucket_server_side_encryption_configuration" "this" {
  count  = var.s3_encryption_enabled ? 1 : 0
  bucket = aws_s3_bucket.this.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm     = "aws:kms"
      kms_master_key_id = var.kms_key_arn
    }
  }
}

# Gated by s3_public_access_blocked.
# false → no PAB resource in the plan → public_access_block_ok and bucket_has_pab fail.
resource "aws_s3_bucket_public_access_block" "this" {
  count  = var.s3_public_access_blocked ? 1 : 0
  bucket = aws_s3_bucket.this.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

resource "aws_s3_bucket_versioning" "this" {
  bucket = aws_s3_bucket.this.id

  versioning_configuration {
    status = "Enabled"
  }
}

