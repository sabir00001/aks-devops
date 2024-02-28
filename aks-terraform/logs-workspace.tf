# Create Azure Log Analytics workspace to be used by AKS cluster
resource "azurerm_log_analytics_workspace" "log_analytics" {
  name                = "aks-cluster-${var.environment}-logs001"
  resource_group_name = azurerm_resource_group.aks_rg.name
  location            = azurerm_resource_group.aks_rg.location
  daily_quota_gb      = 1
  sku                 = "PerGB2018"
  tags = {
    environment = var.environment
  }
}