resource "random_integer" "public_subnet_index" {
  min = 0
  max = length(var.list) - 1
}

resource "random_shuffle" "public_subnet_index" {
  input        = var.list
  result_count = 1
}
