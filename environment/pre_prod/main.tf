module "resource_group" {
  source = "../../child_module/azurerm_resource_group"
  rgs    = var.resource_groups
}


module "virtual_network" {
  source     = "../../child_module/azurerm_virtual_network"
  vnets      = var.vnets
  depends_on = [module.resource_group]

}

module "subnet" {
  source     = "../../child_module/azurerm_subnet"
  subnets = var.subnets
  depends_on = [module.resource_group, module.virtual_network]

}

module "public_ip" {
  source     = "../../child_module/azurerm_public_ip"
  pips       = var.pips
  depends_on = [module.resource_group]

}

module "nsg" {
  source = "../../child_module/azurerm_network_security_group"
  nsgs   = var.nsgs

  depends_on = [module.resource_group]


}

# module "nic_nsg_assn" {
#   source = "../../child_module/azurerm_network_interface_security_group_association"

#   nic_nsg_association = var.nic_nsg_association

#   depends_on = [module.vm_linux, module.nsg]
# }

module "vm_linux" {
  source     = "../../child_module/azurerm_linux_virtual_machine"
  depends_on = [module.resource_group, module.virtual_network, module.subnet, module.public_ip,]

  vms = var.vms
}



