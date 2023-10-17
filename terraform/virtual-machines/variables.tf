variable "node_location" {
  type = string
}
variable "resource_prefix" {
  type = string
}
variable "node_address_space" {
  default = ["10.0.0.0/16"]
}

variable "node_address_prefix" {
  default = ["10.0.1.0/24"]
}

variable "environment" {
  type = string
}

variable "resource_count" {
  type = number
}

variable "vm_username" {
  description = "Enter admin username to SSH into Linux VM"
}

variable "vm_password" {
  description = "Enter admin password to SSH into VM"
}
