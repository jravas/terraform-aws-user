module "random_public_subnet" {
  source = "../../modules/random-from-list"
  list   = local.public_subnets
}

module "random_private_subnet" {
  source = "../../modules/random-from-list"
  list   = local.private_subnets
}

module "serverko" {
  source = "../../modules/ec2-machine"

  name          = "serverko"
  instance_type = "t3.micro"

  ami_id    = data.aws_ami.amazon_linux_latest.id
  subnet_id = data.terraform_remote_state.shared.outputs.vpc.public_subnets[0]
}
