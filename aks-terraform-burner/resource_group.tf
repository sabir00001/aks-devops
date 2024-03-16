# Create Azure resource group
resource "azurerm_resource_group" "aks_rg" {
  location = var.resource_group_location
  name     = "${var.resource_group_name}-${var.environment}"
}