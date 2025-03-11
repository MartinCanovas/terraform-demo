resource "mongodbatlas_database_user" "demo" {
  username           = var.dbuser
  password           = var.dbuser_pwd
  project_id         = "658f2550924000784dc51119"
  auth_database_name = "admin"

  roles {
    role_name     = "read"
    database_name = "admin"
  }
}
