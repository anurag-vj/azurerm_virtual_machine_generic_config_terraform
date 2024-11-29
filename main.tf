resource "azurerm_resource_group" "Resource-Group" {
  name     = "rg-${var.name}"
  location = var.location
}

resource "azurerm_storage_account" "Storage-Account" {
  name                     = "strg${var.name}"
  location                 = azurerm_resource_group.Resource-Group.location
  resource_group_name      = azurerm_resource_group.Resource-Group.name
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_storage_container" "Stoarge-Container" {
  name               = "container${var.name}"
  storage_account_id = azurerm_storage_account.Storage-Account.id
}

resource "azurerm_virtual_network" "Virtual-Network" {
  name                = "vnet-${var.name}"
  location            = azurerm_resource_group.Resource-Group.location
  resource_group_name = azurerm_resource_group.Resource-Group.name
  address_space       = ["192.168.0.0/16"]
}

resource "azurerm_subnet" "Subnet" {
  name                 = "snet-vnet-${var.name}"
  resource_group_name  = azurerm_resource_group.Resource-Group.name
  virtual_network_name = azurerm_virtual_network.Virtual-Network.name
  address_prefixes     = ["192.168.1.0/24"]
}

resource "azurerm_public_ip" "Public-IP" {
  count               = var.enable_pip ? 1 : 0
  name                = "pip-${var.name}"
  location            = azurerm_resource_group.Resource-Group.location
  resource_group_name = azurerm_resource_group.Resource-Group.name
  allocation_method   = "Static"
}

resource "azurerm_network_interface" "Network-Interface" {
  name                = "nic-${var.name}"
  location            = azurerm_resource_group.Resource-Group.location
  resource_group_name = azurerm_resource_group.Resource-Group.name

  ip_configuration {
    name                          = "nic-ipconfig-${var.name}"
    subnet_id                     = azurerm_subnet.Subnet.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = var.enable_pip ? azurerm_public_ip.Public-IP[0].id : null
  }
}

resource "azurerm_linux_virtual_machine" "Virtual-Machine" {
  name                            = "vm-${var.name}"
  location                        = azurerm_resource_group.Resource-Group.location
  resource_group_name             = azurerm_resource_group.Resource-Group.name
  size                            = "Standard_DS3_v2"
  admin_username                  = "testadmin"
  admin_password                  = var.vm_password
  disable_password_authentication = "false"
  network_interface_ids           = [azurerm_network_interface.Network-Interface.id]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }
}


