variable "name" {
  type = string
}

variable "skip_role_assignment" {
  type    = bool
  default = false
}

variable "role_name" {
  type    = string
  default = "Reader"
}

variable "scope" {
  type    = string
  default = null
}

variable "valid_until" {
  type    = string
  default = "2299-12-30T23:00:00Z" #Forever
}
