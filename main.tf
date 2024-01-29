resource "azurerm_container_group" "this" {
  name                = var.container_instance_name
  location            = var.location
  sku                 = var.sku
  os_type             = var.os_type
  resource_group_name = var.resource_group_name
  restart_policy      = var.restart_policy
  ip_address_type     = var.ip_address_type
  subnet_ids          = var.subnet_ids
  tags                = var.tags

  identity {
    type         = var.identity_ids == null ? "SystemAssigned" : "SystemAssigned, UserAssigned"
    identity_ids = var.identity_ids
  }

  dynamic "image_registry_credential" {
    for_each = var.image_registry_credential
    content {
      server   = image_registry_credential.value.server
      username = image_registry_credential.value.username
      password = image_registry_credential.value.password
    }
  }

  dynamic "container" {
    for_each = var.containers
    content {
      name                  = container.value.name
      cpu                   = container.value.cpu
      image                 = container.value.image
      memory                = container.value.memory
      environment_variables = container.value.environment_variables

      dynamic "ports" {
        for_each = container.value.ports_tcp
        content {
          port     = ports.value
          protocol = "TCP"
        }
      }

      dynamic "ports" {
        for_each = container.value.ports_udp
        content {
          port     = ports.value
          protocol = "UDP"
        }
      }

      dynamic "volume" {
        for_each = container.value.volumes
        content {
          name                 = volume.value.name
          mount_path           = volume.value.mount_path
          storage_account_name = volume.value.storage_account_name
          storage_account_key  = volume.value.storage_account_key
          share_name           = volume.value.share_name
        }
      }
    }
  }

  dynamic "exposed_port" {
    for_each = var.exposed_ports_tcp
    content {
      port     = exposed_port.value
      protocol = "TCP"
    }
  }

  dynamic "exposed_port" {
    for_each = var.exposed_ports_udp
    content {
      port     = exposed_port.value
      protocol = "UDP"
    }
  }

  dynamic "dns_config" {
    for_each = length(var.dns_config_nameservers) != 0 ? [1] : []
    content {
      nameservers = var.dns_config_nameservers
    }
  }
}
