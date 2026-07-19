resource "azurerm_network_security_group" "nsg" {
    for_each = var.nsgs
  name                = each.value.nsg_name
  location            = each.value.location
  resource_group_name = each.value.rg_name

  security_rule {
    name                       = each.value.sr_name 
    priority                   = each.value.sr_priority
    direction                  = each.value.sr_direction
    access                     = each.value.sr_access
    protocol                   = each.value.sr_protocol
    source_port_range          = each.value.sr_source_port_range
    destination_port_ranges     = each.value.sr_destination_port_ranges
    source_address_prefix      = each.value.sr_source_address_prefix 
    destination_address_prefix = each.value.sr_destination_address_prefix
  }
}