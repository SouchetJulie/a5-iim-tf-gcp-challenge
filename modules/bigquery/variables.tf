variable "location" {
  description = "Where to is located the BigQuery."
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