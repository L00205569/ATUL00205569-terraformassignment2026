output "instance_id" {
  value = aws_instance.app.id
}

output "security_group_id" {
  value = aws_security_group.app.id
}

output "kms_key_arn" {
  value = aws_kms_key.ebs.arn
}
