resource "mongodbatlas_project" "demo" {
  name   = "Terraform Demo"
  org_id = "5a7a34b33b34b94c8461c286"
  project_owner_id = "5d94bce8ff7a254933a5f80d"
}

# Create an IP Whitelist
resource "mongodbatlas_project_ip_access_list" "demo" {
  count      = length(var.atlas_ip_access_list_cidr)
  project_id = mongodbatlas_project.demo.id
  cidr_block = var.atlas_ip_access_list_cidr[count.index].cidr
  comment    = var.atlas_ip_access_list_cidr[count.index].comment
}

resource "mongodbatlas_maintenance_window" "demo" {
  project_id  = mongodbatlas_project.demo.id
  day_of_week = 1
  hour_of_day = 3
}
