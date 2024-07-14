resource "tls_private_key" "this" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "aws_key_pair" "this" {
  key_name   = var.name
  public_key = tls_private_key.this.public_key_openssh
}

resource "aws_security_group" "this" {
  name        = "${var.name} EC2 Security Group"
  description = "Allow SSH inbound traffic and all outbound traffic"
  vpc_id      = var.vpc_id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "EC2 Security Group"
  }
}

# https://instances.vantage.sh/?region=eu-central-1&cost_duration=monthly&selected=db.m6i.large
resource "aws_instance" "this" {
  ami                    = var.ami_id
  instance_type          = var.instance_type
  subnet_id              = var.subnet_id
  key_name               = aws_key_pair.this.key_name
  vpc_security_group_ids = []

  tags = {
    Name = var.name
  }
}

resource "aws_eip" "this" {
  count    = var.use_elastic_ip ? 1 : 0
  instance = aws_instance.this.id
}
