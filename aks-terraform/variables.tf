variable "resource_group_location" {
  type        = string
  default     = "eastus"
  description = "Location of the resource group."
}
variable "resource_group_name" {
  type    = string
  default = "aks-rg"

}
variable "resource_group_name_prefix" {
  type        = string
  default     = "rg"
  description = "Prefix of the resource group name that's combined with a random ID so name is unique in your Azure subscription."
}

variable "ssh_public_key" {
  type        = string
  description = "SSH public key used to access the cluster."
}
variable "cluster_name" {
  type    = string
  default = "aks-maf"

}
variable "node_count" {
  type        = number
  description = "The initial quantity of nodes for the node pool."
  default     = 1
}

variable "msi_id" {
  type        = string
  description = "The Managed Service Identity ID. Set this value if you're running this example using Managed Identity as the authentication method."
  default     = null
}

variable "username" {
  type        = string
  description = "The admin username for the new cluster."
  default     = "azureadmin"
}

variable "environment" {
  type        = string
  description = "Environment name"
  default = "prod"

}

variable "registry_scope" {
  description = "The scope for the role assignment"
  type        = string
  default     = "/subscriptions/410c1a95-68f7-4b30-9fdc-964a1658482d/resourceGroups/acr-prod-01/providers/Microsoft.ContainerRegistry/registries/aksprodacr"
}