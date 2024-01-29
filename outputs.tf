output "name" {
  value       = azurerm_container_group.this.name
  description = "Name of the Azure Container Instance"
}

output "id" {
  value       = azurerm_container_group.this.id
  description = "Id of the Azure Container Instance"
}

output "ip_address" {
  value       = azurerm_container_group.this.ip_address
  description = "Public IP address of the Azure Container Instance"
}

output "identity" {
  value       = azurerm_container_group.this.identity[*]
  description = "List of identities assigned to the Azure Container Instance"
}
