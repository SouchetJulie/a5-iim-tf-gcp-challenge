resource "google_bigquery_dataset" "dataset" {
  dataset_id                  = var.dataset
  friendly_name               = "dataset"
  description                 = "Data from the cloud function"
  location                    = var.location
  default_table_expiration_ms = 3600000
}

resource "google_bigquery_table" "table" {
  dataset_id           = google_bigquery_dataset.dataset.dataset_id
  table_id             = var.table
  deletion_protection = false
  
  schema               = <<EOF
  [
    {
      "name": "msg",
      "type": "STRING",
      "mode": "NULLABLE",
      "description": "Message"
    }
  ]
  EOF
}
