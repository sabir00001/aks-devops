output "aks_subnet_id" {
    value = azurerm_subnet.aks_subnet.id
  
}

output "vm_subnet_id" {
    value = azurerm_subnet.vm_subnet.id
}