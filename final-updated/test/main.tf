provider "azurerm" {
  skip_provider_registration = true
  features {}
}
# provider "azurerm" {
#   features {}
#   subscription_id = "f1acf2de-6f0e-4092-ae5f-72618cfc297a"
#   client_id       = "c9ce8279-a623-4c97-90fa-4b7fa1e90ef4"
#   client_secret   = "uOyMqb1rmHIywV.LACrDp~psEVcaVUyVrt"
#   tenant_id       = "675c705c-2aae-4d47-9a2a-25476ddc9ccf"
# }

module "vm" {
  source                               = "./../src"
  vm1_virtual_machine_name             = "vm1"
  vm2_virtual_machine_name             = "vm2"
  vm3_virtual_machine_name             = "vm3"
  vm_size                              = "Standard_D3_v2"
  vm_storage_image_id                  = ""
  vm_storage_image_publisher           = "OpenLogic"
  vm_storage_image_offer               = "CentOS"
  vm_storage_image_sku                 = "7.4"
  vm_storage_image_version             = "latest"
  vm_storage_os_disk_name              = "osdisk"
  vm_storage_os_disk_caching           = "ReadWrite"
  vm_storage_os_disk_create_option     = "FromImage"
  vm_storage_os_disk_managed_disk_type = "Standard_LRS"
  vm1_packages                         = ["jdk-11.0.12_linux-x64_bin.rpm", "apache-zookeeper-3.5.6-bin.tar.gz", "elasticsearch-7.2.1-x86_64.rpm", "Saga-1.2.1.5.zip"]
  vm2_packages                         = ["jdk-11.0.12_linux-x64_bin.rpm", "python-lxml-3.2.1-4.el7.x86_64.rpm", "aspire-4.0-SNAPSHOT.tar.gz"]
  vm3_packages                         = ["jdk-11.0.12_linux-x64_bin.rpm", "python-lxml-3.2.1-4.el7.x86_64.rpm", "aspire-4.0-SNAPSHOT.tar.gz"]
  subnet_name                          = "default"
  vnet_name                            = "key-test-vnet"
  vm_name                              = "vm-key34653"
  vm_rg                                = "key-test"
  rg_location                          = "eastus"
  disk_name                            = var.disk_name
  nic_name_vm1                         = "vm1-nic"
  nic_name_vm2                         = "vm2-nic"
  nic_name_vm3                         = "vm3-nic"
  nic_config_name                      = "vm_internal"
  nic_private_ip_address_allocation    = "Dynamic"
  key_vault_name                       = "test-key-vault4589"
  vm_key                               = ""
  private_key                          = "./keys/vm-key34653.pem"
  client_id                            = "c9ce8279-a623-4c97-90fa-4b7fa1e90ef4"
  client_secret                        = "uOyMqb1rmHIywV.LACrDp~psEVcaVUyVrt"
  tenant_id                            = "675c705c-2aae-4d47-9a2a-25476ddc9ccf"
  subscription_id                      = "f1acf2de-6f0e-4092-ae5f-72618cfc297a"
  storage_account_name                 = "teststorage75487567"
  container_name                       = "test"
  file_name                            = "java-11-openjdk-devel-11.0.8.10-1.el7.x86_64.rpm"
  keyvault_vm_password                 = local.keyvault_vm_password

  #vm backup
  recovery_services_vault_name = local.recovery_services_vault_name
  recovery_services_vault_sku  = "Standard"
  vm_backup_policy_name        = local.vm_backup_policy_name
  # policy
  time_zone                      = "UTC"
  instant_restore_retention_days = 2
  backup_frequency               = "Daily"
  backup_time                    = "06:30"
  retention_daily_count          = 10
  soft_delete_enabled            = true
}

variable "disk_name" {
  type = set(object(
    {
      name              = string
      lun               = string
      disk_size_gb      = string
      create_option     = string
      managed_disk_type = string

    }
  ))
  default = [
    {
      name              = "st1"
      lun               = "0"
      disk_size_gb      = 100
      create_option     = "Empty"
      managed_disk_type = "Standard_LRS"
  }]
}




