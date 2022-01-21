resource "mongodbatlas_database_user" "db_user" {
  count              = length(var.mongodb_atlas_users_list)
  username           = var.mongodb_atlas_users_list[count.index].mongodb_atlas_user_name
  password           = var.mongodb_atlas_users_list[count.index].mongodb_atlas_user_psw
  project_id         = mongodbatlas_project.tf-support.id
  auth_database_name = var.mongodb_atlas_users_list[count.index].mongodb_atlas_auth_db_name

  roles {
    role_name     = var.mongodb_atlas_users_list[count.index].mongodb_atlas_role_name
    database_name = var.mongodb_atlas_users_list[count.index].mongodb_atlas_db_name
  }
}

# Custom DB Role
resource "mongodbatlas_custom_db_role" "myCustomRole" {
  project_id = mongodbatlas_project.tf-support.id
  role_name  = "myCustomRole"

  actions {
    action = "CHANGE_STREAM"
    resources {
      collection_name = ""
      database_name   = "sample_airbnb"
    }
  }

  inherited_roles {
    role_name     = "read"
    database_name = "sample_airbnb"
  }
}