# Create a resource group
resource "azurerm_resource_group" "example_rg" {
  name     = "rg-${var.resource_prefix}-vms"
  location = var.node_location
}

# Create a virtual network within the resource group
resource "azurerm_virtual_network" "example_vnet" {
  name                = "${var.resource_prefix}-vnet"
  resource_group_name = azurerm_resource_group.example_rg.name
  location            = var.node_location
  address_space       = var.node_address_space
}

# Create a subnets within the virtual network
resource "azurerm_subnet" "example_subnet" {
  name                 = "${var.resource_prefix}-subnet"
  resource_group_name  = azurerm_resource_group.example_rg.name
  virtual_network_name = azurerm_virtual_network.example_vnet.name
  address_prefixes     = var.node_address_prefix
}

# Create Linux Public IP
resource "azurerm_public_ip" "example_public_ip" {
  count = var.resource_count
  name  = "${var.resource_prefix}-${format("%02d", count.index)}-PublicIP"
  location            = azurerm_resource_group.example_rg.location
  resource_group_name = azurerm_resource_group.example_rg.name
  allocation_method   = "Static"
  domain_name_label   = "${var.resource_prefix}-${count.index}"
  tags = {
    environment = "Test"
  }
}

# Create Network Interface
resource "azurerm_network_interface" "example_nic" {
  count = var.resource_count
  name                = "${var.resource_prefix}-${format("%02d", count.index)}-NIC"
  location            = azurerm_resource_group.example_rg.location
  resource_group_name = azurerm_resource_group.example_rg.name
  #
  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.example_subnet.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = element(azurerm_public_ip.example_public_ip.*.id, count.index)
  }
}

# Creating resource NSG
resource "azurerm_network_security_group" "example_nsg" {
  name                = "${var.resource_prefix}-NSG"
  location            = azurerm_resource_group.example_rg.location
  resource_group_name = azurerm_resource_group.example_rg.name
  # Security rule can also be defined with resource azurerm_network_security_rule, here just defining it inline.
  security_rule {
    name                       = "Inbound"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "*"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
  tags = {
    environment = "Test"
  }
}

# Subnet and NSG association
resource "azurerm_subnet_network_security_group_association" "example_subnet_nsg_association" {
  subnet_id                 = azurerm_subnet.example_subnet.id
  network_security_group_id = azurerm_network_security_group.example_nsg.id
}

# Virtual Machine Creation — Linux
resource "azurerm_virtual_machine" "example_linux_vm" {
  count = var.resource_count
  name  = "${var.resource_prefix}-${format("%02d", count.index)}"
  location                      = azurerm_resource_group.example_rg.location
  resource_group_name           = azurerm_resource_group.example_rg.name
  network_interface_ids         = [element(azurerm_network_interface.example_nic.*.id, count.index)]
  vm_size                       = "Standard_B2s"
  delete_os_disk_on_termination = true
  storage_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-focal"
    sku       = "20_04-lts"
    version   = "latest"
  }
  storage_os_disk {
    name              = "myosdisk-${count.index}"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }
  os_profile {
    computer_name  = "linuxhost"
    admin_username = var.vm_username
    admin_password = var.vm_password
  }
  os_profile_linux_config {
    disable_password_authentication = false
  }
  tags = {
    environment = "Test"
  }

  connection {
    type     = "ssh"
    host     = azurerm_public_ip.example_public_ip[count.index].ip_address
    password = var.vm_password
    user     = var.vm_username
  }

  provisioner "file" {
    source      = "${path.module}/post_install/tools.sh"
    destination = "/home/${var.vm_username}/tools.sh"
  }

  provisioner "remote-exec" {
    inline = [
      "sudo chmod +x /home/${var.vm_username}/tools.sh",
      "/home/${var.vm_username}/tools.sh"
    ]
  }
}


