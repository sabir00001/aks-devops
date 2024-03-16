resource "azurerm_kubernetes_cluster_node_pool" "aks_user_node" {
  name                  = "userpool"
  kubernetes_cluster_id = azurerm_kubernetes_cluster.aks_cluster.id
  vm_size               = var.node_vm_size
  max_count             = 2
  min_count             = 1
  mode                  = "User"
  os_type               = "Linux"
  enable_auto_scaling   = true
  vnet_subnet_id        = var.aks_subnet_id
  #orchestrator_version =   "1.22.6"


  node_labels = {
    "nodepool-type" = "user-app"
    "environment"   = var.environment
    "nodepoolos"    = "linux"
  }

  tags = {
    "nodepool-type" = "user-app"
    "environment"   = var.environment
    "nodepoolos"    = "linux"
  }
}