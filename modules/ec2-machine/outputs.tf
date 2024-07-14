output "ec2" {
  value = aws_instance.this
}

output "key" {
  sensitive = true
  value     = tls_private_key.this.private_key_openssh
}
