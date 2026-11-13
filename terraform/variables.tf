variable "owner" {
  description = "Owner tag value — student ID for this assignment."
  type        = string
}

variable "region" {
  description = "AWS region. Enforced at plan time by sentinel/aws_ireland_region_restriction.sentinel."
  type        = string
}

variable "environment" {
  description = "Environment name. dev | staging | prod."
  type        = string
}

variable "instance_type" {
  description = "EC2 instance type. Enforced at plan time by sentinel/aws_ec2_metadata_ssh_security.sentinel."
  type        = string
}

variable "ssh_cidr" {
  description = "CIDR allowed to reach port 22. Enforced at plan time by sentinel/aws_ec2_metadata_ssh_security.sentinel."
  type        = string
}

variable "require_imdsv2" {
  description = "Require IMDSv2 on EC2 instances. Setting to false will fail Sentinel."
  type        = bool
}

variable "s3_encryption_enabled" {
  description = "Whether to create the S3 SSE-KMS configuration. false will fail the S3 policy."
  type        = bool
}

variable "s3_public_access_blocked" {
  description = "Whether to create the S3 public access block. false will fail the S3 policy."
  type        = bool
}
