resource "azurerm_virtual_machine" "linux_vm" {
  name                         = var.virtual_machine_name
  location                     = var.rg_location
  resource_group_name          = var.vm_rg
  network_interface_ids        = var.network_interface_ids
  primary_network_interface_id = var.primary_network_interface_id
  vm_size                      = var.vm_size

  storage_image_reference {
    #id        = var.vm_storage_image_id
    publisher = var.vm_storage_image_publisher
    offer     = var.vm_storage_image_offer
    sku       = var.vm_storage_image_sku
    version   = var.vm_storage_image_version
  }

  storage_os_disk {
    name              = var.vm_storage_os_disk_name
    caching           = var.vm_storage_os_disk_caching
    create_option     = var.vm_storage_os_disk_create_option
    managed_disk_type = var.vm_storage_os_disk_managed_disk_type
  }

  dynamic "storage_data_disk" {
    for_each = var.disk_name
    content {
      name              = "${var.virtual_machine_name}-${storage_data_disk.value["name"]}"
      lun               = storage_data_disk.value["lun"]
      disk_size_gb      = storage_data_disk.value["disk_size_gb"]
      create_option     = storage_data_disk.value["create_option"]
      managed_disk_type = storage_data_disk.value["managed_disk_type"]
    }
  }

  os_profile {
    computer_name  = var.vm_computer_name
    admin_username = var.vm_admin_username
    admin_password = var.vm_admin_password
  }

  os_profile_linux_config {
    disable_password_authentication = true
    ssh_keys {
      key_data = var.key_data
      path     = "/home/${var.vm_admin_username}/.ssh/authorized_keys"
    }
  }
}
