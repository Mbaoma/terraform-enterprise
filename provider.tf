terraform {
  backend "remote" {
    hostname = "app.terraform.io"
    organization = "top-one-per-cent"

    workspaces {
      name = "terraform-enterprise"
    }
  }
}



# terraform {
#   required_providers {
#     aws = {
#       source  = "hashicorp/aws"
#       version = "2.59.0"
#     }
#   }
# }

provider "aws" {
  region = "eu-west-1"
}
