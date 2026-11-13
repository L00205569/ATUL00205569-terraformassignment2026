variable "region" {
  type        = string
  description = "AWS region — must be Ireland or an approved EU failover."
}

variable "environment" {
  type        = string
  description = "Environment tag value."
}

variable "instance_type" {
  type        = string
  description = "Approved EC2 instance type."
}

variable "subnet_id" {
  type        = string
  description = "Subnet to launch the instance into."
}

variable "vpc_id" {
  type        = string
  description = "VPC to attach the security group to."
}

variable "ssh_cidr" {
  type        = string
  description = "CIDR allowed to reach port 22. Must not be 0.0.0.0/0."
}

variable "owner" {
  type        = string
  description = "Owner tag."
}
