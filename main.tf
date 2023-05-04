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
  storage  = var.storage
}