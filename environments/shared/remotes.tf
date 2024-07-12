terraform {
  backend "remote" {
    organization = "vlajina-gajba"


    workspaces {
      name = "shared"
    }
  }
}
