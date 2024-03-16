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
  default = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDZ6qi6kOlYXj27y6ojrsCqSdeMzh3686H2VBwsywVpByfC+ouRAalqnqbylH5h7GQLISdWQVTi7Pp3aEY+Qjz+6brD4DKpH4OoaSMaBVNvouvSWbUVGZvrNqhCfcYlGagLvAg/nFWqlV0DwEnKjdZzQs2ietUaiBXaJxpcRWq7Krrt2mZpICkOAmx6qu0iaHVNj6Ep/qk0wy+3je10MsddmrkQJ4kjmPB3CBwglqcRyvI1dwK5xojISb1STk2OBQwJfYEg/FQgXSKgx6+aKwTZKkPz5+CvFcrCrYeigFHt4ksP9NuoAkIynuoCc8rU7l2NH2scuQ4dxSAS385YqrbUQLwEHi7Gg+HNEqsX3D3Ecf/ocx7KWMvx8RCQdip8dtZ5wjMek1/2xujdlj8leYqkQjYs2zx1z5fciMKSgfUvV7Gls9tHQHU5buxenRDQNK3lzYLK23sjrq/ZCrhNsDOv6S2kUTA6xs/HmvwKf+L5yjtssTRoK1nrYT3TNrF22Cwu2jVXJnwlgp2Qz+vhG3zhBX7Et7sLXdOwsNZE9xvqt/KQwpoahyTbXRo+eYbAhrp6UjsiJ/YVRoLonXUX5/IhKbZHk5s9eYHaAMy/mY/CM/W07yHk74nPT/yoDKU3MVizyvrN/NLwYzA/ydJMOhUqkFR1vdcOZQqpqTkX4cRLlw== azureuser@myserver"
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
