variable "org_id" {
  default = "5a7a34b33b34b94c8461c286"
}

variable "project_id" {
  default = "5da8a973ff7a2539f938f2f0"
}

variable "cluster_name" {
  default = "tf-support"
}

variable "email_address" {
  default = "martin.canovas@mongodb.com"
}

variable "atlas_ip_access_list_cidr" {
  description = "List of IP, CIDR for Atlas Access List"
  type        = list(map(string))
  default = [
    {
      cidr    = "207.251.78.32/29"
      comment = "New York Authenticated/Employee / Stealth live 6/28/19"
    },
    {
      cidr    = "74.113.166.152/29"
      comment = "New York / GigStream live 6/28/19"
    },
    {
      cidr    = "77.107.233.160/29"
      comment = "Dublin VPN"
    },
    {
      cidr    = "186.137.0.0/16"
      comment = "Home Network"
    }
  ]
}

variable "atlas_ip_access_list_sg" {
  description = "List of SG for Atlas Access List"
  type        = list(map(string))
  default = [
    {
      sg      = "sg-04c0723872034ea9e"
      comment = "SG replicaset42"
    },
    {
      sg      = "sg-05df5db0e8233916f"
      comment = "SG omserver"
    },
    {
      sg      = "sg-056eba412ff385eb6"
      comment = "SG DB-Client"
    }
  ]
}

variable "mongodb_atlas_users_list" {
  description = "List of users in Mongo"
  type        = list(map(string))
  default = [
    {
      mongodb_atlas_user_name    = "terraform"
      mongodb_atlas_user_psw     = "terraform"
      mongodb_atlas_auth_db_name = "admin"
      mongodb_atlas_db_name      = "admin"
      mongodb_atlas_role_name    = "atlasAdmin"
    },
    {
      mongodb_atlas_user_name    = "dbuser1"
      mongodb_atlas_user_psw     = "dbuser1"
      mongodb_atlas_auth_db_name = "admin"
      mongodb_atlas_db_name      = "admin"
      mongodb_atlas_role_name    = "readWriteAnyDatabase"
    },
    {
      mongodb_atlas_user_name    = "dbuser2"
      mongodb_atlas_user_psw     = "dbuser2"
      mongodb_atlas_auth_db_name = "admin"
      mongodb_atlas_db_name      = "admin"
      mongodb_atlas_role_name    = "readAnyDatabase"
    }
  ]
}

variable "replication_factor" {
  description = "Number of members in the replica set"
  default     = "3"
}

variable "mongo_db_major_version" {
  description = "MongoDB version"
  default     = "4.4"
}

variable "provider_instance_size_name" {
  description = "Instance type"
  default     = "M10"
}

variable "provider_region_name" {
  description = "Provider region"
  default     = "US_EAST_2"
}

variable "aws_vpc_id" {
  default = "vpc-02eeeb89477451b29"
}

variable "aws_subnet_id" {
  default = ["subnet-01c8527ece0c6afdb", "subnet-0c10242c0731c21ad"]
}

variable "aws_sg_id" {
  default = ["sg-04c0723872034ea9e"]
}

variable "aws-access-key-id" {
  default = ""
}

variable "aws-secret-access-key" {
  default = ""
}

variable "MONGODB_ATLAS_PUBLIC_KEY" {
  default = ""
}

variable "MONGODB_ATLAS_PRIVATE_KEY" {
  default = ""
}