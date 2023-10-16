resource "mongodbatlas_alert_configuration" "demo" {
  project_id = var.project_id
  event_type = "DAILY_BILL_OVER_THRESHOLD"
  enabled    = true
  threshold_config {
    operator  = "GREATER_THAN"
    threshold = 90
    units     = "RAW"
  }

  notification {
    type_name     = "EMAIL"
    interval_min  = 60
    delay_min     = 5
    sms_enabled   = false
    email_address = var.email_address
  }

}