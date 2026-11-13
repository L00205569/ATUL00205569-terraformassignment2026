variable "region" {
  type        = string
  description = "AWS region — determines subnet AZ."
}

variable "environment" {
  type        = string
  description = "Environment tag value."
}

variable "owner" {
  type        = string
  description = "Owner tag."
}
