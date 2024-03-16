# Create Azure Log Analytics workspace to be used by AKS cluster
resource "azurerm_log_analytics_workspace" "log_analytics" {
  name                = "aks-cluster-${var.environment}-logs-001"
  resource_group_name = var.rg_name
  location            = var.location
  daily_quota_gb      = 1
  sku                 = "PerGB2018"
  tags = {
    environment = var.environment
  }
}