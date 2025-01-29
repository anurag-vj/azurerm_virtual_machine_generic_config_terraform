variable "name" {
  type = string
}

variable "location" {
  type = string
}

variable "enable_pip" {
  type = bool
}

variable "vm_password" {
  type      = string
  sensitive = true
}

variable "subscription_id" {
  type = string
}