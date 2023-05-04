resource "google_storage_bucket" "backend" {  
  name                        = var.backend           
  location                    = var.location
  force_destroy               = true
  uniform_bucket_level_access = true
}