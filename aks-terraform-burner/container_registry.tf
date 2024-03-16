resource "azurerm_container_registry" "aks_acr" {
  name                = "mafacr${var.environment}01"
  resource_group_name = azurerm_resource_group.aks_rg.name
  location            = azurerm_resource_group.aks_rg.location
  sku                 = "Standard"
  admin_enabled       = false
  tags = {
    Environment = "var.environment"
  }
}
resource "azurerm_role_assignment" "acr_role" {
  principal_id                     = azurerm_kubernetes_cluster.aks_cluster.kubelet_identity[0].object_id
  role_definition_name             = "AcrPull"
  scope                            = azurerm_container_registry.aks_acr.id
  skip_service_principal_aad_check = true
  depends_on = [
    azurerm_container_registry.aks_acr
  ]
}