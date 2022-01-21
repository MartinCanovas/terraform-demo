resource "mongodbatlas_project" "tf-support" {
  name   = "Terraform Support"
  org_id = "5a7a34b33b34b94c8461c286"
  #  project_owner_id = "5d94bce8ff7a254933a5f80d"
}

# Create an IP Whitelist
resource "mongodbatlas_project_ip_access_list" "ip_access_list_cidr" {
  count      = length(var.atlas_ip_access_list_cidr)
  project_id = mongodbatlas_project.tf-support.id
  cidr_block = var.atlas_ip_access_list_cidr[count.index].cidr
  comment    = var.atlas_ip_access_list_cidr[count.index].comment
}

resource "mongodbatlas_maintenance_window" "tf-support" {
  project_id  = mongodbatlas_project.tf-support.id
  day_of_week = 1
  hour_of_day = 3
}

resource "mongodbatlas_auditing" "tf-support" {
  project_id                  = mongodbatlas_project.tf-support.id
  audit_filter                = "{ 'atype': 'authenticate', 'param': {   'user': 'auditAdmin',   'db': 'admin',   'mechanism': 'SCRAM-SHA-1' }}"
  audit_authorization_success = false
  enabled                     = false
}

#resource "mongodbatlas_cloud_provider_access" "tf-support" {
#  project_id    = mongodbatlas_project.tf-support.id
#  provider_name = "AWS"
#}

resource "mongodbatlas_cloud_provider_access_setup" "tf-support" {
  project_id    = "61eaad196657c41768aaba47"
  provider_name = "AWS"
}

resource "aws_iam_role" "tf-support" {
  name = "tf-support"

  # Terraform's "jsonencode" function converts a
  # Terraform expression result to valid JSON syntax.
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Sid    = ""
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      },
    ]
  })

  tags = {
    Name = "terraform test"
  }
}

resource "mongodbatlas_cloud_provider_access_authorization" "tf-support" {
  project_id = "61eaad196657c41768aaba47"
  role_id    = mongodbatlas_cloud_provider_access_setup.tf-support.role_id

  aws = {
    iam_assumed_role_arn = aws_iam_role.tf-support.arn
  }
}