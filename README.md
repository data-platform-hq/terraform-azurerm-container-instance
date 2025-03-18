# Azure Container Intance Terraform module
Terraform module for creation Azure Container Intance

## Usage

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0.0 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | >= 3.68.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | >= 3.68.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_container_group.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/container_group) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_container_instance_name"></a> [container\_instance\_name](#input\_container\_instance\_name) | Specifies the name of the Container Group. | `string` | n/a | yes |
| <a name="input_containers"></a> [containers](#input\_containers) | List of objects to configure containers | <pre>list(object({<br/>    name                  = string<br/>    image                 = string<br/>    cpu                   = number<br/>    memory                = number<br/>    environment_variables = optional(map(string))<br/>    commands              = optional(list(string))<br/>    ports_tcp             = optional(set(string), [])<br/>    ports_udp             = optional(set(string), [])<br/>    volumes = optional(list(object({<br/>      mount_path           = string<br/>      name                 = string<br/>      storage_account_name = optional(string)<br/>      storage_account_key  = optional(string)<br/>      share_name           = optional(string)<br/>    })), [])<br/>  }))</pre> | n/a | yes |
| <a name="input_dns_config_nameservers"></a> [dns\_config\_nameservers](#input\_dns\_config\_nameservers) | A list of nameservers the containers will search out to resolve requests. | `list(string)` | `[]` | no |
| <a name="input_exposed_ports_tcp"></a> [exposed\_ports\_tcp](#input\_exposed\_ports\_tcp) | Set of ports to expose with TCP protocol | `set(string)` | `[]` | no |
| <a name="input_exposed_ports_udp"></a> [exposed\_ports\_udp](#input\_exposed\_ports\_udp) | Set of ports to expose with UDP protocol | `set(string)` | `[]` | no |
| <a name="input_identity_ids"></a> [identity\_ids](#input\_identity\_ids) | Specifies a list of User Assigned Managed Identity IDs to be assigned to this Container Group. | `list(string)` | `null` | no |
| <a name="input_image_registry_credential"></a> [image\_registry\_credential](#input\_image\_registry\_credential) | List of objects to configure connection to private registry | <pre>list(object({<br/>    server                    = string<br/>    username                  = string<br/>    password                  = string<br/>    user_assigned_identity_id = string<br/>  }))</pre> | `[]` | no |
| <a name="input_ip_address_type"></a> [ip\_address\_type](#input\_ip\_address\_type) | Specifies the IP address type of the container. Public, Private or None. | `string` | `"Public"` | no |
| <a name="input_location"></a> [location](#input\_location) | Specifies the supported Azure location where the resource exists. | `string` | n/a | yes |
| <a name="input_os_type"></a> [os\_type](#input\_os\_type) | The OS for the container group. Allowed values are Linux and Windows. | `string` | `"Linux"` | no |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | The name of the resource group in which to create the Container Group. | `string` | n/a | yes |
| <a name="input_restart_policy"></a> [restart\_policy](#input\_restart\_policy) | Restart policy for the container group. Allowed values are Always, Never, OnFailure. | `string` | `"Never"` | no |
| <a name="input_sku"></a> [sku](#input\_sku) | Specifies the sku of the Container Group. Possible values are Confidential, Dedicated and Standard. | `string` | `"Standard"` | no |
| <a name="input_subnet_ids"></a> [subnet\_ids](#input\_subnet\_ids) | The subnet resource IDs for a container group. | `list(string)` | `[]` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | Resource tags. | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_id"></a> [id](#output\_id) | Id of the Azure Container Instance |
| <a name="output_identity"></a> [identity](#output\_identity) | List of identities assigned to the Azure Container Instance |
| <a name="output_ip_address"></a> [ip\_address](#output\_ip\_address) | Public IP address of the Azure Container Instance |
| <a name="output_name"></a> [name](#output\_name) | Name of the Azure Container Instance |
<!-- END_TF_DOCS -->

## License

Apache 2 Licensed. For more information please see [LICENSE](https://github.com/data-platform-hq/terraform-azurerm-container-instance/blob/automated_readme/LICENSE)
