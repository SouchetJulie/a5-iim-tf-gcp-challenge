# The storage for the Terraform state
resource "google_storage_bucket" "backend" {  
  name                        = var.backend           
  location                    = var.location
  force_destroy               = true
  uniform_bucket_level_access = true
}

# The storage for everything else
resource "google_storage_bucket" "storage" {  
  name                        = var.storage           
  location                    = var.location
  force_destroy               = true
  uniform_bucket_level_access = true
}