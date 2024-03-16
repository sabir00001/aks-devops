resource "azurerm_public_ip" "aks_lb_ip" {
  name                = "akspublicip${var.environment}"
  resource_group_name = azurerm_kubernetes_cluster.aks_cluster.node_resource_group
  location            = azurerm_resource_group.aks_rg.location
  allocation_method   = "Static"

  tags = {
    environment = "var.environment"
  }
}