resource "mongodbatlas_alert_configuration" "alert1" {
  project_id = "658f2550924000784dc51119"
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
    email_address = "demo@mongodb.com"
  }

}

resource "mongodbatlas_alert_configuration" "alert2" {
  project_id = "658f2550924000784dc51119"
  event_type = "PENDING_INVOICE_OVER_THRESHOLD"
  enabled    = true
  threshold_config {
    operator  = "GREATER_THAN"
    threshold = 2
    units     = "RAW"
  }

  notification {
    type_name     = "EMAIL"
    interval_min  = 60
    delay_min     = 5
    sms_enabled   = false
    email_address = "demo@mongodb.com"
  }

}