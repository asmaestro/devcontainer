<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.3 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | >= 3.11, < 4.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | >= 3.11, < 4.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_network_interface.example_nic](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/network_interface) | resource |
| [azurerm_network_security_group.example_nsg](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/network_security_group) | resource |
| [azurerm_public_ip.example_public_ip](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/public_ip) | resource |
| [azurerm_resource_group.example_rg](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/resource_group) | resource |
| [azurerm_subnet.example_subnet](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/subnet) | resource |
| [azurerm_subnet_network_security_group_association.example_subnet_nsg_association](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/subnet_network_security_group_association) | resource |
| [azurerm_virtual_machine.example_linux_vm](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/virtual_machine) | resource |
| [azurerm_virtual_network.example_vnet](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/virtual_network) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_environment"></a> [environment](#input\_environment) | n/a | `string` | n/a | yes |
| <a name="input_node_address_prefix"></a> [node\_address\_prefix](#input\_node\_address\_prefix) | n/a | `list` | <pre>[<br>  "10.0.1.0/24"<br>]</pre> | no |
| <a name="input_node_address_space"></a> [node\_address\_space](#input\_node\_address\_space) | n/a | `list` | <pre>[<br>  "10.0.0.0/16"<br>]</pre> | no |
| <a name="input_node_location"></a> [node\_location](#input\_node\_location) | n/a | `string` | n/a | yes |
| <a name="input_resource_count"></a> [resource\_count](#input\_resource\_count) | n/a | `number` | n/a | yes |
| <a name="input_resource_prefix"></a> [resource\_prefix](#input\_resource\_prefix) | n/a | `string` | n/a | yes |
| <a name="input_vm_password"></a> [vm\_password](#input\_vm\_password) | Enter admin password to SSH into VM | `any` | n/a | yes |
| <a name="input_vm_username"></a> [vm\_username](#input\_vm\_username) | Enter admin username to SSH into Linux VM | `any` | n/a | yes |

## Outputs

No outputs.
<!-- END_TF_DOCS -->