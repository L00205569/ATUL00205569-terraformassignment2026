variable "bucket_name" {
  type        = string
  description = "Globally unique bucket name."
}

variable "kms_key_arn" {
  type        = string
  description = "KMS key ARN used for SSE-KMS."
}

variable "s3_encryption_enabled" {
  type        = bool
  description = "Whether to create the SSE-KMS configuration. false fails the S3 policy."
}

variable "s3_public_access_blocked" {
  type        = bool
  description = "Whether to create the public access block. false fails the S3 policy."
}

variable "owner" {
  type        = string
  description = "Owner tag."
}
