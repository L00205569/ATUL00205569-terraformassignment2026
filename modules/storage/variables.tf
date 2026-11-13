variable "bucket_name" {
  type        = string
  description = "Globally unique bucket name."
}

variable "kms_key_arn" {
  type        = string
  description = "KMS key ARN used for SSE-KMS."
}

variable "owner" {
  type        = string
  description = "Owner tag."
}

variable "s3_encryption_enabled" {
  type = bool
}

variable "s3_public_access_blocked" {
  type = bool
}
