variable "bucket" {
  description = "The name of the bucket where the source code is stored."
  type        = string  
}

variable "region" {
  description = "Where to is located the bucket."
  type        = string
}

variable "dataset" {
  description = "The id of the BigQuery dataset to access."
  type        = string
}

variable "table" {
  description = "The id of the BigQuery table to access."
  type        = string
}

variable "project" {
  description = "The name of the project in which to create the infrastructure."
  type        = string
}