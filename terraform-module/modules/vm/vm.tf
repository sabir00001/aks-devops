
resource "azurerm_network_security_group" "vm_nsg" {
  name                = "agentvmnsg"
  location            = var.location
  resource_group_name = var.rg_name

  security_rule {
    name                       = "allow"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "*"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }

  tags = {
    environment = "Production"
  }
}

resource "azurerm_network_interface" "agent_vm_nic" {
  name                = "agent-vm-nic"
  location            = var.location
  resource_group_name = var.rg_name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = var.vm_subnet
    private_ip_address_allocation = "Dynamic"
  }
  
}

resource "azurerm_linux_virtual_machine" "agent_vm" {
  name                = "agent-vm-${var.environment}"
  resource_group_name = var.rg_name
  location            = var.location
  size                = "Standard_F2"
  admin_username      = var.vmusername
  network_interface_ids = [
    azurerm_network_interface.agent_vm_nic.id
  ]
  admin_ssh_key {
    username   = var.vmusername
    public_key = file("~/.ssh/agent_vm_01.pub")
  }

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
    disk_size_gb = 30
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }
}
resource "azurerm_network_interface_security_group_association" "vm_nsg_association" {
  network_interface_id      = azurerm_network_interface.agent_vm_nic.id
  network_security_group_id = azurerm_network_security_group.vm_nsg.id
}