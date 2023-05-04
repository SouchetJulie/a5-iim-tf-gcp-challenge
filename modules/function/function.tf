# Upload the zipped source code to bucket
resource "google_storage_bucket_object" "object" {
  name   = "function.zip"
  bucket = var.bucket
  source = "./modules/function/function.zip"
}

# Create the cloud function
resource "google_cloudfunctions2_function" "function" {
  name        = "function"
  location    = var.region
  description = "hello world"

  build_config {
    runtime     = "nodejs16"
    entry_point = "helloHttp" # Set the entry point
    source {
      storage_source {
        bucket = var.bucket
        object = google_storage_bucket_object.object.name
      }
    }
  }

  service_config {
    max_instance_count = 1
    available_memory   = "256M"
    timeout_seconds    = 60
  }
}
