resource "mongodbatlas_database_user" "dbuser2" {
  username           = "dbuser2"
  password           = var.dbuser_pwd
  project_id         = "622b7a8372fc9a0c13947267"
  auth_database_name = "admin"

  roles {
    role_name     = "readWrite"
    database_name = "admin"
  }

#  roles {
#    role_name     = "readWriteAnyDatabase"
#    database_name = "admin"
#  }
}

resource "mongodbatlas_database_user" "dbuser3" {
  username           = "dbuser3"
  password           = var.dbuser_pwd
  project_id         = "622b7a8372fc9a0c13947267"
  auth_database_name = "admin"

  roles {
    role_name     = "atlasAdmin"
    database_name = "admin"
  }
}
