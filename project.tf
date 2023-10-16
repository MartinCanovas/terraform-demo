resource "mongodbatlas_maintenance_window" "martin" {
  project_id  = var.project_id
  day_of_week = 2
  hour_of_day = 10
}