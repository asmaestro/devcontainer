provider "azurerm" {
  subscription_id = var.sub_id
  features {}
}

module "virtual-machines" {
  source          = "./virtual-machines"
  app_id          = var.app_id
  password        = var.password
  sub_id          = var.sub_id
  tenant_id       = var.tenant_id
  node_location   = var.node_location
  resource_prefix = var.resource_prefix
  environment     = var.environment
  resource_count  = var.resource_count
  vm_username     = var.vm_username
  vm_password     = var.vm_password  
}