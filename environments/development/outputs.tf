
output "ec2" {
  value = module.serverko.ec2
}

output "ec2_key" {
  sensitive = true
  value     = module.serverko.key
}
