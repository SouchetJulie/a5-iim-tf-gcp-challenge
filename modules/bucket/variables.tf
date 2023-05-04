variable "location" {
  description = "Where to create the buckets. (ex. EU, US)"
  type        = string  
}

variable "backend" {
  description = "What name to give to the backend bucket."
  type        = string
  default     = ""
}