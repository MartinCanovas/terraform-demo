variable "project_id" {
  default = "622b7a8372fc9a0c13947267"
}

variable "cluster_name" {
  default = "cluster0"
}

variable "mongo_db_major_version" {
  description = "MongoDB version"
  default     = "6.0"
}

variable "instance_size" {
  description = "Instance type"
  default     = "M20"
}

variable "MONGODB_ATLAS_PUBLIC_KEY" {}
variable "MONGODB_ATLAS_PRIVATE_KEY" {}
