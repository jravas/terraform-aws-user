# https://instances.vantage.sh/?region=eu-central-1&cost_duration=monthly&selected=db.m6i.large
resource "aws_instance" "this" {
  ami           = var.ami_id
  instance_type = var.instance_type
  subnet_id     = var.subnet_id

  tags = {
    Name = var.name
  }
}
