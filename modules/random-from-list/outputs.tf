output "index_from_range" {
  value = var.list[random_integer.public_subnet_index.result]
}
