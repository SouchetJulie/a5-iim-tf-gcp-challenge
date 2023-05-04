variable "location" {
  description = "Where to create the buckets. (ex. EU, US)"
  type        = string  
}

variable "backend" {
  description = "What name to give to the backend bucket."
  type        = string
}

variable "storage" {
  description = "What name to give to the storage bucket."
  type        = string
}