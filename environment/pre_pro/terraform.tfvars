
resource_groups = {
    rg1 = {
      rg_name  = "rg-dev-07"
      location = "central india"
    }
  }
  
 vnets = {
    vnet1 = {
      vnet_name     = "vnet-dev-07"
      rg_name       = "rg-dev-07"
      location      = "central india"
      address_space = ["10.0.0.0/16"]
    }
  }

 subnets = {
    sbnet1 = {
      subnet_name      = "subnet-dev-07"
      rg_name          = "rg-dev-07"
      vnet_name        = "vnet-dev-07"
      address_prefixes = ["10.0.1.0/24"]
    }

    sbnet2 = {
      subnet_name      = "subnet-dev-08"
      rg_name          = "rg-dev-07"
      vnet_name        = "vnet-dev-07"
      address_prefixes = ["10.0.2.0/24"]
    }

    sbnet3 = {
      subnet_name      = "AzureBastionSubnet"
      rg_name          = "rg-dev-07"
      vnet_name        = "vnet-dev-07"
      address_prefixes = ["10.0.3.0/26"]
    }

  }

    pips = {
    pip1 = {
      pip_name          = "pip-dev-07"
      rg_name           = "rg-dev-07"
      location          = "central india"
      allocation_method = "Static"
    }


    pip2 = {
      pip_name          = "pip-dev-08"
      rg_name           = "rg-dev-07"
      location          = "central india"
      allocation_method = "Static"
    }
  }

vms = {
  vm1 = {
    rg_name                         = "rg-dev-07"
    location                        = "central india"
    vnet_name                       = "vnet-dev-07"
    subnet_name                     = "subnet-dev-07"
    pip_name                        = "pip-dev-07"
    nic_name                        = "nic-dev-07"
    ip_config_name                  = "Internal"
    private_ip_address_allocation   = "Dynamic"
    allocation_method               = "Static"
    vm_name                         = "vm-frontend"
    vm_size                        = "Standard_D2_v3"
    admin_username                  = "admindevops"
    admin_password                  = "Devops@12345"
    disable_password_authentication = false
    os_caching                      = "ReadWrite"
    storage_account_type            = "Standard_LRS"
    image_publisher                 = "Canonical"
    image_offer                     = "0001-com-ubuntu-server-jammy"
    image_sku                       = "22_04-lts"
    image_version                   = "latest"
  }

  vm2 = {
    rg_name                         = "rg-dev-07"
    location                        = "central india"
    vnet_name                       = "vnet-dev-07"
    subnet_name                     = "subnet-dev-08"
    pip_name                        = "pip-dev-08"
    nic_name                        = "nic-dev-08"
    ip_config_name                  = "Internal"
    private_ip_address_allocation   = "Dynamic"
    allocation_method               = "Static"
    vm_name                         = "vm-backendend"
    vm_size                        = "Standard_D2_v3"
    admin_username                  = "admindevops"
    admin_password                  = "Devops@12345"
    disable_password_authentication = false
    os_caching                      = "ReadWrite"
    storage_account_type            = "Standard_LRS"
    image_publisher                 = "Canonical"
    image_offer                     = "0001-com-ubuntu-server-jammy"
    image_sku                       = "22_04-lts"
    image_version                   = "latest"
  }
}
