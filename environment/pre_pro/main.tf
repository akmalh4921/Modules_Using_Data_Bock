module "resource_group" {
  source = "../../child_module/azurerm_resource_group"
 rgs = var.resource_groups
}


module "virtual_network" {
  source     = "../../child_module/azurerm_virtual_network"
  depends_on = [module.resource_group]
vnets = var.vnets

}

module "subnet" {
  source     = "../../child_module/azurerm_subnet"
  depends_on = [module.resource_group, module.virtual_network]

subnets = var.subnets
 
}

module "public_ip" {
  source     = "../../child_module/azurerm_public_ip"
  depends_on = [module.resource_group]
pips =var.pips

}

module "vm_linux" {
  source     = "../../child_module/azurerm_network_interface"
  depends_on = [module.resource_group, module.virtual_network, module.subnet, module.public_ip]

  vms = var.vms
}



