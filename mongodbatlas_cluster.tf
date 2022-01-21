# Create a Cluster
resource "mongodbatlas_cluster" "tf-support" {
  project_id         = mongodbatlas_project.tf-support.id
  name               = var.cluster_name
  cluster_type       = "REPLICASET"
  replication_factor = var.replication_factor
  # cloud_backup                 = true
  pit_enabled                  = false
  auto_scaling_disk_gb_enabled = true
  auto_scaling_compute_enabled = false
  mongo_db_major_version       = var.mongo_db_major_version

  //Provider Settings "block"
  provider_name = "AWS"
  disk_size_gb  = 100
  #provider_disk_iops          = 300
  provider_volume_type        = "STANDARD"
  provider_instance_size_name = var.provider_instance_size_name
  provider_region_name        = var.provider_region_name

}

#resource "mongodbatlas_encryption_at_rest" "test" {
#  project_id = var.project_id

#  aws_kms = {
#    enabled                = true
#    customer_master_key_id = "arn:aws:kms:us-east-2:655848829540:key/f6acd978-40fb-44f8-a190-41634f1a99fb"
#    region                 = "US_EAST_2"
#    role_id                = mongodbatlas_cloud_provider_access.role.role_id
#  }

#}