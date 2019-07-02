variable "application_name" {
  type = string
}

variable "role_name" {
  type    = string
  default = "Reader"
}

variable "scope" {
  type = string
}

variable "valid_until" {
  type    = string
  default = "2299-12-30T23:00:00Z" #Forever
}


