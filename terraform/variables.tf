variable "app_id" {
  description = "Azure Kubernetes Service Cluster service principal"
}

variable "password" {
  description = "Azure Kubernetes Service Cluster password"
}

variable "sub_id" {
  description = "Subscription ID"
}

variable "tenant_id" {
  description = "Tenant ID"
}

variable "resource_count" {
  type = number
}

variable "node_location" {
  type = string
}
variable "resource_prefix" {
  type = string
}
variable "node_address_space" {
  default = ["10.0.0.0/16"]
}

#variable for network range
variable "node_address_prefix" {
  default = ["10.0.1.0/24"]
}

variable "environment" {
  type = string
}

variable "vm_username" {
  description = "Enter admin username to SSH into Linux VM"
}

variable "vm_password" {
  description = "Enter admin password to SSH into VM"
}
