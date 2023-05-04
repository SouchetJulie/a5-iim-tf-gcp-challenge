# The storage for the Terraform state
resource "google_storage_bucket" "backend" {  
  name                        = var.backend           
  location                    = var.location
  force_destroy               = true
  uniform_bucket_level_access = true
}

# The storage for everything else
resource "random_id" "bucket_prefix" {
  byte_length = 8
}

resource "google_storage_bucket" "bucket" {
  name                        = "${random_id.bucket_prefix.hex}-gcf-source" # unique name     
  location                    = var.location
  force_destroy               = true
  uniform_bucket_level_access = true
}