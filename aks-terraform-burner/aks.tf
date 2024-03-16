# Generate random resource group name
resource "random_pet" "rg_name" {
  prefix = var.resource_group_name_prefix
}



# Generate random Kubernetes cluster nam
resource "random_pet" "azurerm_kubernetes_cluster_name" {
  prefix = "cluster" # Prefix for the random name generation
}

# Create Azure Kubernetes Service (AKS) cluster
resource "azurerm_kubernetes_cluster" "aks_cluster" {
  location            = azurerm_resource_group.aks_rg.location              # Location where the AKS cluster will be deployed
  name                = "${var.cluster_name}-cluster-${var.environment}"    # Name of the AKS cluster
  resource_group_name = azurerm_resource_group.aks_rg.name                  # Name of the Azure resource group where the AKS cluster will be deployed
  dns_prefix          = "${var.cluster_name}-cluster-${var.environment}"    # DNS prefix for the AKS cluster
  node_resource_group = "${var.cluster_name}-control-rg-${var.environment}" # Name of the resource group for the control plane
  #kubernetes_version = "1.22.6"                                            # Kubernetes version for the AKS cluster
  identity {
    type = "SystemAssigned" # Assign system-assigned identity
  }

  default_node_pool {
    name                = "systempool"
    vm_size             = "Standard_D2_v2"
    node_count          = var.node_count # Number of nodes in the pool
    enable_auto_scaling = true           # Enable autoscaling
    zones               = [1, 2, 3]      # Availability zones for the nodes
    min_count           = 1
    max_count           = 2
    type                = "VirtualMachineScaleSets"
    os_disk_size_gb     = 30
    vnet_subnet_id      = azurerm_subnet.aks_subnet.id #ID of the subnet in the VNet
   # Label for the node pool type
    node_labels = { 
      "nodepool-type" = "system"
      "environment"   = var.environment
      "nodepoolos"    = "linux"
      "app"           = "system-apps"
    } 
    # Tag for the node pool type
    tags = { 
      "nodepool-type" = "system"
      "environment"   = var.environment
      "nodepoolos"    = "linux"
      "app"           = "system-apps"
    }
  }
  linux_profile {
    admin_username = var.username

    ssh_key {
      key_data = var.ssh_public_key
    }
  }
  network_profile {
    network_plugin    = "azure"
    load_balancer_sku = "standard"
  }
  oms_agent {
    log_analytics_workspace_id = azurerm_log_analytics_workspace.log_analytics.id
  }
   key_vault_secrets_provider {
    secret_rotation_enabled = true  # Enable secret rotation
   }
  # Add the following if you want to use Azure AD RBAC
  # azure_active_directory_role_based_access_control {
  #   managed = true
  #   admin_group_object_ids = ["0fba5acf-7f65-4dab-8ec8-52a14c0940ce"]
  # }
  depends_on = [ azurerm_resource_group.aks_rg, azurerm_subnet.aks_subnet]

}

# Example of Azure role assignment (if uncommented)
/*
resource "azurerm_role_assignment" "acr" {
  principal_id                     = azurerm_kubernetes_cluster.aks_cluster.kubelet_identity[0].object_id
  role_definition_name             = "AcrPull"
  scope                            = var.registry_scope
  skip_service_principal_aad_check = true
}*/