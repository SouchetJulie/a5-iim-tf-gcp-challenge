terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "4.63.1"
    }
  }
  
  backend "gcs" {
    bucket = "juliesouchet04052023"
    prefix = "terraform/state"
  }
}

provider "google" {  
  region  = var.region
  zone    = var.zone
  project = var.project
}

# Manage the storage
module "bucket" {
  source   = "./modules/bucket"
  location = var.location
  backend  = var.backend
}

# Manage the cloud function
module "function" {
  source  = "./modules/function"
  bucket  = module.bucket.bucket_name
  region  = var.region
  dataset = module.dataset.dataset_id
  table   = module.dataset.table_id
  project = var.project
}

# Manage the dataset
module "dataset" {
  source   = "./modules/bigquery"
  location = var.location
  dataset  = var.backend
  table    = var.table
}
