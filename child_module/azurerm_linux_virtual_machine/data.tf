data "azurerm_subnet" "data_subnet" {
  for_each = var.vms

  name                 = each.value.subnet_name
  virtual_network_name = each.value.vnet_name
  resource_group_name  = each.value.rg_name
}

data "azurerm_public_ip" "data_pip" {
  for_each = var.vms

  name                = each.value.pip_name
  resource_group_name = each.value.rg_name
}

data "azurerm_network_security_group" "data_nsg" {
    for_each = var.vms

  name                = each.value.nsg_name
  resource_group_name = each.value.rg_name
}

data "azurerm_network_interface" "data_nic" {
  for_each = var.vms
  
  name                = each.value.nic_name
  resource_group_name = each.value.rg_name
}