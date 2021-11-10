resource "azurerm_network_interface" "vm1" {
  name                = var.nic_name_vm1
  location            = var.rg_location
  resource_group_name = var.vm_rg

  ip_configuration {
    name                          = var.nic_config_name
    subnet_id                     = data.azurerm_subnet.main.id
    private_ip_address_allocation = var.nic_private_ip_address_allocation
  }
}

module "vm1" {
  source                               = "./vm"
  virtual_machine_name                 = var.vm1_virtual_machine_name
  rg_location                          = var.rg_location
  vm_rg                                = var.vm_rg
  network_interface_ids                = ["${azurerm_network_interface.vm1.id}"]
  primary_network_interface_id         = azurerm_network_interface.vm1.id
  vm_size                              = var.vm_size
  vm_storage_image_id                  = var.vm_storage_image_id
  vm_storage_image_publisher           = var.vm_storage_image_publisher
  vm_storage_image_offer               = var.vm_storage_image_offer
  vm_storage_image_sku                 = var.vm_storage_image_sku
  vm_storage_image_version             = var.vm_storage_image_version
  vm_storage_os_disk_name              = "${var.vm1_virtual_machine_name}-${var.vm_storage_os_disk_name}"
  vm_storage_os_disk_caching           = var.vm_storage_os_disk_caching
  vm_storage_os_disk_create_option     = var.vm_storage_os_disk_create_option
  vm_storage_os_disk_managed_disk_type = var.vm_storage_os_disk_managed_disk_type
  disk_name                            = var.disk_name
  key_data                             = azurerm_ssh_public_key.main.public_key
  vm_computer_name                     = "aipuser1"
  vm_admin_username                    = "aipuser1"
  vm_admin_password                    = random_password.password.result
  depends_on                           = [azurerm_network_interface.vm1, random_password.password, azurerm_ssh_public_key.main]
}

resource "azurerm_network_interface" "vm2" {
  name                = var.nic_name_vm2
  location            = var.rg_location
  resource_group_name = var.vm_rg

  ip_configuration {
    name                          = var.nic_config_name
    subnet_id                     = data.azurerm_subnet.main.id
    private_ip_address_allocation = var.nic_private_ip_address_allocation
  }
}
module "vm2" {
  source                               = "./vm"
  virtual_machine_name                 = var.vm2_virtual_machine_name
  rg_location                          = var.rg_location
  vm_rg                                = var.vm_rg
  network_interface_ids                = ["${azurerm_network_interface.vm2.id}"]
  primary_network_interface_id         = azurerm_network_interface.vm2.id
  vm_size                              = var.vm_size
  vm_storage_image_id                  = var.vm_storage_image_id
  vm_storage_image_publisher           = var.vm_storage_image_publisher
  vm_storage_image_offer               = var.vm_storage_image_offer
  vm_storage_image_sku                 = var.vm_storage_image_sku
  vm_storage_image_version             = var.vm_storage_image_version
  vm_storage_os_disk_name              = "${var.vm2_virtual_machine_name}-${var.vm_storage_os_disk_name}"
  vm_storage_os_disk_caching           = var.vm_storage_os_disk_caching
  vm_storage_os_disk_create_option     = var.vm_storage_os_disk_create_option
  vm_storage_os_disk_managed_disk_type = var.vm_storage_os_disk_managed_disk_type
  disk_name                            = var.disk_name
  key_data                             = azurerm_ssh_public_key.main.public_key
  vm_computer_name                     = "aipuser2"
  vm_admin_username                    = "aipuser2"
  vm_admin_password                    = random_password.password.result
  depends_on                           = [module.vm1, azurerm_network_interface.vm2, azurerm_ssh_public_key.main]
}

resource "azurerm_network_interface" "vm3" {
  name                = var.nic_name_vm3
  location            = var.rg_location
  resource_group_name = var.vm_rg

  ip_configuration {
    name                          = var.nic_config_name
    subnet_id                     = data.azurerm_subnet.main.id
    private_ip_address_allocation = var.nic_private_ip_address_allocation
  }
}

module "vm3" {
  source                               = "./vm"
  virtual_machine_name                 = var.vm3_virtual_machine_name
  rg_location                          = var.rg_location
  vm_rg                                = var.vm_rg
  network_interface_ids                = ["${azurerm_network_interface.vm3.id}"]
  primary_network_interface_id         = azurerm_network_interface.vm3.id
  vm_size                              = var.vm_size
  vm_storage_image_id                  = var.vm_storage_image_id
  vm_storage_image_publisher           = var.vm_storage_image_publisher
  vm_storage_image_offer               = var.vm_storage_image_offer
  vm_storage_image_sku                 = var.vm_storage_image_sku
  vm_storage_image_version             = var.vm_storage_image_version
  vm_storage_os_disk_name              = "${var.vm3_virtual_machine_name}-${var.vm_storage_os_disk_name}"
  vm_storage_os_disk_caching           = var.vm_storage_os_disk_caching
  vm_storage_os_disk_create_option     = var.vm_storage_os_disk_create_option
  vm_storage_os_disk_managed_disk_type = var.vm_storage_os_disk_managed_disk_type
  disk_name                            = var.disk_name
  key_data                             = azurerm_ssh_public_key.main.public_key
  vm_computer_name                     = "aipuser3"
  vm_admin_username                    = "aipuser3"
  vm_admin_password                    = random_password.password.result
  depends_on                           = [module.vm2, azurerm_network_interface.vm3, azurerm_ssh_public_key.main]
}

