
####################################################################
### vm back up###
####################################################################
# resource "azurerm_recovery_services_vault" "main" {
#   name                = var.recovery_services_vault_name
#   location            = var.rg_location
#   resource_group_name = var.vm_rg
#   sku                 = var.recovery_services_vault_sku
#   soft_delete_enabled = var.soft_delete_enabled
#   depends_on          = [azurerm_virtual_machine.linux_vm]
# }

# resource "azurerm_backup_policy_vm" "main" {
#   name                = var.vm_backup_policy_name
#   resource_group_name = var.vm_rg
#   recovery_vault_name = azurerm_recovery_services_vault.main.name

#   timezone = var.time_zone

#   instant_restore_retention_days = var.instant_restore_retention_days

#   backup {
#     frequency = var.backup_frequency
#     time      = var.backup_time
#   }

#   retention_daily {
#     count = var.retention_daily_count
#   }

#   depends_on = [azurerm_recovery_services_vault.main]
# }


# resource "azurerm_backup_protected_vm" "main" {
#   resource_group_name = var.vm_rg
#   recovery_vault_name = azurerm_recovery_services_vault.main.name
#   source_vm_id        = azurerm_virtual_machine.linux_vm.id
#   backup_policy_id    = azurerm_backup_policy_vm.main.id

#   depends_on = [azurerm_virtual_machine.linux_vm,
#   azurerm_backup_policy_vm.main, azurerm_recovery_services_vault.main]
# }
