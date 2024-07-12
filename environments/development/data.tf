data "terraform_remote_state" "shared" {
  backend = "remote"

  config = {
    organization = "vlajina-gajba"
    workspaces = {
      name = "shared"
    }
  }
}

data "aws_ami" "amazon_linux_latest" {
  most_recent = true

  filter {
    name   = "name"
    values = ["al*-ami-*-x86_64"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  # https://us-east-1.console.aws.amazon.com/ec2/home?region=us-east-1#Images:visibility=public-images
  owners = ["137112412989"] # Amazon's AWS account ID for Amazon Linux AMIs
}
