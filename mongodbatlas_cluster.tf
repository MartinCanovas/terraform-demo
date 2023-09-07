resource "mongodbatlas_advanced_cluster" "demo" {
  project_id   = var.project_id
  name         = var.cluster_name
  cluster_type = "REPLICASET"
  mongo_db_major_version = var.mongo_db_major_version

  replication_specs {
    region_configs {
      electable_specs {
        instance_size = var.instance_size
        node_count    = 3
      }
      provider_name         = "AWS"
      region_name           = "US_EAST_2"
      priority              = 7
    }
  }
}
