
resource "azurerm_network_security_group" "aks_nsg" {
  name                = "${var.cluster_name}-nsg-${var.environment}"
  location            = var.location
  resource_group_name = var.rg_name
}

resource "azurerm_virtual_network" "aks_vnet" {
  name                = "${var.cluster_name}-vnet-${var.environment}"
  location            = var.location
  resource_group_name = var.rg_name
  address_space       = ["10.0.0.0/8"]

  tags = {
    environment = var.environment
  }
}
resource "azurerm_subnet" "aks_subnet" {
  name                 = "aks-subnet"
  resource_group_name  = var.rg_name
  virtual_network_name = azurerm_virtual_network.aks_vnet.name
  address_prefixes     = ["10.0.0.0/23"]

}

resource "azurerm_subnet" "vm_subnet" {
  name                 = "vm-subnet"
  resource_group_name  = var.rg_name
  virtual_network_name = azurerm_virtual_network.aks_vnet.name
  address_prefixes     = ["10.0.2.0/23"]

}

# other subnest 10.0.4.0/23