
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

nics = {
  nic1 = {
    rg_name                       = "rg-dev-07"
    location                      = "central india"
    vnet_name                     = "vnet-dev-07"
    subnet_name                   = "subnet-dev-07"
    pip_name                      = "pip-dev-07"
    nic_name                      = "nic-dev-07"
    ip_config_name                = "Internal"
    private_ip_address_allocation = "Dynamic"
    allocation_method             = "Static"
  }

  nic2 = {
    rg_name                       = "rg-dev-07"
    location                      = "central india"
    vnet_name                     = "vnet-dev-07"
    subnet_name                   = "subnet-dev-08"
    pip_name                      = "pip-dev-08"
    nic_name                      = "nic-dev-08"
    ip_config_name                = "Internal"
    private_ip_address_allocation = "Dynamic"
    allocation_method             = "Static"
  }
}


nsgs = {
  nsg1 = {
    nsg_name = "NetworkSecurityGroup1"
    location = "central india"
    rg_name  = "rg-dev-07"

    sr_name                       = "AllowHTTPSSH"
    sr_priority                   = 100
    sr_direction                  = "Inbound"
    sr_access                     = "Allow"
    sr_protocol                   = "Tcp"
    sr_source_port_range          = "*"
    sr_destination_port_ranges    = ["22", "80"]
    sr_source_address_prefix      = "*"
    sr_destination_address_prefix = "*"
  }
  nsg2 = {
    nsg_name = "NetworkSecurityGroup2"
    location = "central india"
    rg_name  = "rg-dev-07"

    sr_name                       = "AllowHTTPSSH"
    sr_priority                   = 100
    sr_direction                  = "Inbound"
    sr_access                     = "Allow"
    sr_protocol                   = "Tcp"
    sr_source_port_range          = "*"
    sr_destination_port_ranges    = ["22", "80"]
    sr_source_address_prefix      = "*"
    sr_destination_address_prefix = "*"
  }
}


vms = {
  vm1 = {
    vnet_name                       = "vnet-dev-07"
    subnet_name                     = "subnet-dev-07"
    pip_name                        = "pip-dev-07"
    ip_config_name                  = "Internal"
    private_ip_address_allocation   = "Dynamic"
    allocation_method               = "Static"
    rg_name                         = "rg-dev-07"
    location                        = "central india"
    nic_name                        = "nic-dev-07"
    nsg_name                        = "NetworkSecurityGroup1"
    vm_name                         = "vm-frontend"
    vm_size                         = "Standard_D2_v3"
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
    vnet_name                       = "vnet-dev-07"
    subnet_name                     = "subnet-dev-08"
    pip_name                        = "pip-dev-08"
    ip_config_name                  = "Internal"
    private_ip_address_allocation   = "Dynamic"
    allocation_method               = "Static"
    rg_name                         = "rg-dev-07"
    location                        = "central india"
    nic_name                        = "nic-dev-08"
    nsg_name                        = "NetworkSecurityGroup2"
    vm_name                         = "vm-backendend"
    vm_size                         = "Standard_D2_v3"
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



