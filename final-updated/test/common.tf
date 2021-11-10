resource "random_integer" "int_suffix" {
  min = 100
  max = 999
  keepers = {
    # Generate a new id each time we change any of the prefix varibles
    base_name_prefix = local.base_name_prefix
  }
}


locals {
  // based on JobAid naming convention
  base_name_prefix = "${local.client_name_short}${local.location_short}${local.project_name_short}${local.environment_short}${local.cloud_type_short}"
  base_name_suffix = random_integer.int_suffix.result


  # Shorten and lowercase input parameters from UI
  client_name_short  = substr(lower(var.client_name), 0, 3)
  location_short     = substr(lower(var.location), 0, 2)
  project_name_short = substr(lower(var.project_name), 0, 2)
  environment_short  = substr(lower(var.environment), 0, 1)
  cloud_type_short   = substr(lower(var.cloud_type), 0, 1)

  vm_name                      = "${local.base_name_prefix}centos${local.base_name_suffix}"
  os_disk_name                 = "${local.base_name_prefix}od${local.base_name_suffix}"
  recovery_services_vault_name = "${local.base_name_prefix}sv${local.base_name_suffix}"
  vm_backup_policy_name        = "${local.base_name_prefix}bp${local.base_name_suffix}"
  keyvault_vm_password         = "${local.base_name_prefix}vmp${local.base_name_suffix}"


  common_tags = {
    "key" = "value"
  }

}