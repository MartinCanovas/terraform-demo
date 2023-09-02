terraform {
  required_providers {
    mongodbatlas = {
      source  = "mongodb/mongodbatlas"
      version = "1.11.0"
    }
  }
}

provider "mongodbatlas" {
  MONGODB_ATLAS_PUBLIC_KEY=""
  MONGODB_ATLAS_PRIVATE_KEY=""
}

terraform {
  backend "remote" {
    organization = "Martin_Org"

    workspaces {
      name = "terraform-demo"
    }
  }
}
