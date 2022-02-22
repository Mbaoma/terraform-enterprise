

terraform {
  cloud {
    organization = "top-one-per-cent"

    workspaces {
      name = "cli-driven"
    }
  }
}

provider "aws" {
  region = "eu-west-1"
}
