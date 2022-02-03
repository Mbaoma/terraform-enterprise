terraform {
  backend "remote" {
    hostname = "app.terraform.io"
    organization = "top-one-per-cent"

    workspaces {
      name = "terraform-enterprise"
    }
  }
}


provider "aws" {
  region = "eu-west-1"
}
