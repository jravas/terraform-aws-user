locals {
  private_subnets = data.terraform_remote_state.shared.outputs.vpc.private_subnets
  public_subnets  = data.terraform_remote_state.shared.outputs.vpc.public_subnets
  vpc_id          = data.terraform_remote_state.shared.outputs.vpc.vpc_id

  ami_id = data.aws_ami.amazon_linux_latest.id
}
