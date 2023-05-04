
variable "region" {
  description = "The region in which to create the infrastructure."
  type        = string
}

variable "zone" {
  description = "The zone in which to create the infrastructure. Must match the region."
  type        = string
}

variable "project" {
  description = "The name of the project in which to create the infrastructure."
  type        = string
}

variable "backend" {
  description = "The name of the bucket in which to store the Terraform state data."
  type        = string
}

variable "storage" {
  description = "What name to give to the storage bucket."
  type        = string
}

variable "location" {
  description = "Where to create the buckets. (ex. EU, US)"
  type        = string  
}

