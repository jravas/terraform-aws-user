module "random_public_subnet" {
  source = "../../modules/random-from-list"

  list = local.public_subnets
}

module "random_private_subnet" {
  source = "../../modules/random-from-list"

  list = local.private_subnets
}

module "serverko" {
  source = "../../modules/ec2-machine"

  name          = "serverko"
  instance_type = "t3.micro"

  ami_id         = local.ami_id
  vpc_id         = local.vpc_id
  subnet_id      = module.random_public_subnet.index_from_range
  use_elastic_ip = true
}

module "mali" {
  source = "../../modules/ec2-machine"

  name          = "mali-serverko"
  instance_type = "t3.nano"

  ami_id    = local.ami_id
  vpc_id    = local.vpc_id
  subnet_id = module.random_private_subnet.index_from_range
}

module "prase" {
  source = "../../modules/ec2-machine"

  name          = "prase"
  instance_type = "t3.large"

  ami_id         = local.ami_id
  vpc_id         = local.vpc_id
  subnet_id      = module.random_public_subnet.index_from_range
  use_elastic_ip = true
}
