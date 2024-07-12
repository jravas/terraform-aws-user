locals {
  private_subnets = data.terraform_remote_state.shared.outputs.vpc.private_subnets
  public_subnets  = data.terraform_remote_state.shared.outputs.vpc.public_subnets
}
