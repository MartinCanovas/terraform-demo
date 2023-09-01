resource "mongodbatlas_advanced_cluster" "test" {
  project_id   = mongodbatlas_project.martin.id
  name         = var.cluster_name
  cluster_type = "REPLICASET"

  replication_specs {
    region_configs {
      electable_specs {
        instance_size = "M10"
      }
      provider_name         = "AWS"
      region_name           = "US_EAST_2"
      priority              = 7
    }
  }
}
