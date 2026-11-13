policy "aws_ireland_region_restriction" {
  source            = "./aws_ireland_region_restriction.sentinel"
  enforcement_level = "hard-mandatory"
}

policy "terraform_provider_source_version" {
  source            = "./terraform_provider_source_version.sentinel"
  enforcement_level = "hard-mandatory"
}

policy "aws_ec2_metadata_ssh_security" {
  source            = "./aws_ec2_metadata_ssh_security.sentinel"
  enforcement_level = "hard-mandatory"
}

policy "aws_s3_encryption_public_access" {
  source            = "./aws_s3_encryption_public_access.sentinel"
  enforcement_level = "hard-mandatory"
}
