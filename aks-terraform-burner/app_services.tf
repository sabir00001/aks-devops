/*
variable "app_service_names" {
  type    = list(string)
  default = ["sabir-east-us-app-01", "sabir-east-us-app-02", "sabir-east-us-app-03"]
}

resource "azurerm_app_service_plan" "app_plan" {
  name                = "app-plan-${var.environment}"
  location            = azurerm_resource_group.aks_rg.location
  resource_group_name = azurerm_resource_group.aks_rg.name

  sku {
    tier = "basic"
    size = "B1"
  }
}

resource "azurerm_app_service" "app_service" {
  count               = length(var.app_service_names)
  name                = var.app_service_names[count.index]
  location            = azurerm_resource_group.aks_rg.location
  resource_group_name = azurerm_resource_group.aks_rg.name
  app_service_plan_id = azurerm_app_service_plan.app_plan.id

  site_config {
    dotnet_framework_version = "v4.0"
    scm_type                 = "LocalGit"
    http2_enabled = true
    ftps_state = "Disabled"
  }
  https_only = true
  identity {
    type = "SystemAssigned"
  }
  app_settings = {
    "SOME_KEY" = "test-settings"
  }
 
}
*/