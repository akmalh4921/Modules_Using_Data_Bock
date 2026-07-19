
resource "azurerm_network_interface" "nic" {
  for_each = var.vms

  name                = each.value.nic_name
  resource_group_name = each.value.rg_name
  location            = each.value.location


  ip_configuration {
    name                          = each.value.ip_config_name
    subnet_id                     = data.azurerm_subnet.data_subnet[each.key].id
    public_ip_address_id          = data.azurerm_public_ip.data_pip[each.key].id
    private_ip_address_allocation = each.value.private_ip_address_allocation
  }
}

resource "azurerm_network_interface_security_group_association" "nic_nsg_assn" {
  for_each = var.vms

  network_interface_id      = data.azurerm_network_interface.data_nic[each.key].id
  network_security_group_id = data.azurerm_network_security_group.data_nsg[each.key].id
}


resource "azurerm_linux_virtual_machine" "vms_linux" {
  for_each = var.vms

  name                            = each.value.vm_name
  resource_group_name             = each.value.rg_name
  location                        = each.value.location
  size                            = each.value.vm_size
  admin_username                  = each.value.admin_username
  admin_password                  = each.value.admin_password
  disable_password_authentication = each.value.disable_password_authentication


  network_interface_ids = [
  azurerm_network_interface.nic[each.key].id]

  os_disk {
    caching              = each.value.os_caching
    storage_account_type = each.value.storage_account_type
  }

  source_image_reference {
    publisher = each.value.image_publisher
    offer     = each.value.image_offer
    sku       = each.value.image_sku
    version   = each.value.image_version
  }
}
