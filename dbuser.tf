resource "mongodbatlas_database_user" "dbuser1" {
  username           = "dbuser1"
  password           = var.password
  project_id         = var.project_id
  auth_database_name = "admin"

  roles {
    role_name     = "readAnyDatabase"
    database_name = "admin"
  }

  labels {
    key   = "env"
    value = "demo"
  }

  scopes {
    name   = "dev"
    type = "CLUSTER"
  }
}