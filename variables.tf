variable "location" {
  type        = string
  description = "Specifies the supported Azure location where the resource exists."
}

variable "container_instance_name" {
  type        = string
  description = "Specifies the name of the Container Group."
}

variable "resource_group_name" {
  type        = string
  description = "The name of the resource group in which to create the Container Group."
}

variable "tags" {
  type        = map(string)
  description = "Resource tags."
  default     = {}
}

variable "sku" {
  type        = string
  description = "Specifies the sku of the Container Group. Possible values are Confidential, Dedicated and Standard. "
  default     = "Standard"
}

variable "os_type" {
  type        = string
  description = "The OS for the container group. Allowed values are Linux and Windows."
  default     = "Linux"
}

variable "restart_policy" {
  type        = string
  description = "Restart policy for the container group. Allowed values are Always, Never, OnFailure."
  default     = "Never"
}

variable "identity_ids" {
  type        = list(string)
  description = "Specifies a list of User Assigned Managed Identity IDs to be assigned to this Container Group."
  default     = null
}

variable "ip_address_type" {
  type        = string
  description = "Specifies the IP address type of the container. Public, Private or None."
  default     = "Public"
}

variable "subnet_ids" {
  type        = list(string)
  description = "The subnet resource IDs for a container group."
  default     = []
}

variable "exposed_ports_tcp" {
  type        = set(string)
  description = "Set of ports to expose with TCP protocol"
  default     = []
}

variable "exposed_ports_udp" {
  type        = set(string)
  description = "Set of ports to expose with UDP protocol"
  default     = []
}

variable "image_registry_credential" {
  type = list(object({
    server   = string
    username = string
    password = string
  }))
  description = "List of objects to configure connection to private registry"
  default     = []
}

variable "dns_config_nameservers" {
  type        = list(string)
  description = "A list of nameservers the containers will search out to resolve requests. "
  default     = []
}

variable "containers" {
  type = list(object({
    name                  = string
    image                 = string
    cpu                   = number
    memory                = number
    environment_variables = optional(map(string))
    commands              = optional(list(string))
    ports_tcp             = optional(set(string), [])
    ports_udp             = optional(set(string), [])
    volumes = optional(list(object({
      mount_path           = string
      name                 = string
      storage_account_name = optional(string)
      storage_account_key  = optional(string)
      share_name           = optional(string)
    })), [])
  }))
  description = "List of objects to configure containers"
}
