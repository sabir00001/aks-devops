resource "azurerm_container_registry" "aks_acr" {
  name                = "mafacr${var.environment}01"
  resource_group_name = var.rg_name
  location            = var.location
  sku                 = "Standard"
  admin_enabled       = false
  tags = {
    Environment = "var.environment"
  }
}