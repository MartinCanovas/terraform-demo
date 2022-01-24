terraform {
  required_providers {
    mongodbatlas = {
      source  = "mongodb/mongodbatlas"
      version = "0.9.1"
    }

    aws = {
      source  = "hashicorp/aws"
      version = ">= 3.0"
    }
  }

  required_version = ">= 0.14"
}

provider "mongodbatlas" {}

provider "aws" {
  region     = "us-east-2"
  profile    = "default"
  access_key = var.aws-access-key-id
  secret_key = var.aws-secret-access-key
}

terraform {
  backend "remote" {
    organization = "Martin_Org"

    workspaces {
      name = "tf-support"
    }
  }
}