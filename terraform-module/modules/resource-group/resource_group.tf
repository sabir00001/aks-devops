# Create Azure resource group
resource "azurerm_resource_group" "aks_rg" {
  location = var.location
  name     = "${var.rg_name}-${var.environment}"
}