terraform {
  required_providers {
    mongodbatlas = {
      source  = "mongodb/mongodbatlas"
      version = "1.28.0"
    }
  }
}

provider "mongodbatlas" {}

terraform {
  backend "remote" {
    organization = "Martin_Org"

    workspaces {
      name = "terraform-demo"
    }
  }
}
