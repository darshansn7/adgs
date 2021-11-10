
variable "vm1_virtual_machine_name" {
  type        = string
  description = "virtual machine name"
  default     = ""
}

variable "vm2_virtual_machine_name" {
  type        = string
  description = "virtual machine name"
  default     = ""
}

variable "vm3_virtual_machine_name" {
  type        = string
  description = "virtual machine name"
  default     = ""
}




variable "vm_size" {
  type        = string
  description = "size of the virtual machine"
  default     = ""
}

variable "vm_storage_image_id" {
  type        = string
  description = "vm image id"
  default     = ""
}

variable "vm_storage_image_publisher" {
  type        = string
  description = "publisher of the image used to create the virtual machine"
  default     = "Canonical"
}

variable "vm_storage_image_offer" {
  type        = string
  description = "offer of the image used to create the virtual machine"
  default     = "UbuntuServer"
}

variable "vm_storage_image_sku" {
  type        = string
  description = "SKU of the image used to create the virtual machine"
  default     = "16.04-LTS"
}

variable "vm_storage_image_version" {
  type        = string
  description = "version of the image used to create the virtual machine"
  default     = "latest"
}

variable "vm_storage_os_disk_name" {
  type        = string
  description = "name of the OS Disk."
  default     = ""
}

variable "vm_storage_os_disk_caching" {
  type        = string
  description = "Specifies the caching requirements for the OS Disk"
  default     = ""
}

variable "vm_storage_os_disk_create_option" {
  type        = string
  description = "Specifies how the OS Disk should be created ,Possible values are Attach and FromImage"
  default     = ""
}

variable "vm_storage_os_disk_managed_disk_type" {
  type        = string
  description = "Specifies the type of Managed Disk which should be created"
  default     = ""
}

variable "vm_key" {
  type        = string
  description = "subnet name"
  default     = ""
}

variable "vm_name" {
  type        = string
  description = "vm-name"
  default     = ""
}

variable "subnet_name" {
  type        = string
  description = "subnet name"
  default     = ""
}

variable "vnet_name" {
  type        = string
  description = "vnet name"
  default     = ""
}

variable "vm_rg" {
  type        = string
  description = "virtual machine resource group name"
  default     = ""
}

variable "key_vault_name" {
  type = string
}

variable "nic_name_vm1" {
  type        = string
  description = "network interferance name"
  default     = ""
}

variable "nic_name_vm2" {
  type        = string
  description = "network interferance name"
  default     = ""
}

variable "nic_name_vm3" {
  type        = string
  description = "network interferance name"
  default     = ""
}

variable "rg_location" {
  type        = string
  description = "resource group location"
  default     = "eastus"
}


variable "nic_config_name" {
  type        = string
  description = "network interferance config name"
  default     = ""
}

variable "nic_private_ip_address_allocation" {
  type        = string
  description = "specifies private address allocation type"
  default     = ""
}



variable "private_key" {
  type        = string
  description = "key"
  #default     = "./vm-key.pem"
}

variable "client_id" {
  type        = string
  description = "client id"
  default     = ""
}

variable "client_secret" {
  type        = string
  description = "client secret"
  default     = ""
}

variable "tenant_id" {
  type        = string
  description = "tenant id"
  default     = ""
}

variable "subscription_id" {
  type        = string
  description = "subscription id"
  default     = ""
}

variable "storage_account_name" {
  type = string
}

variable "container_name" {
  type = string
}

variable "file_name" {
  type = string
}



variable "keyvault_vm_password" {
  type = string
}

#####################################################################
#### vm back up###
#####################################################################
variable "recovery_services_vault_name" {
  type        = string
  description = "the name of the Recovery Services Vault"
  default     = ""
}


variable "recovery_services_vault_sku" {
  type        = string
  description = "recovery services vault sku"
  default     = "Standard"
}

variable "vm_backup_policy_name" {
  type        = string
  description = "backup policy name"
  default     = "vm-backup-policy765"
}


# policy variables
variable "time_zone" {
  type        = string
  description = "specifies the time zone"
  default     = "UTC"
}

variable "instant_restore_retention_days" {
  type        = number
  description = "Specifies the instant restore retention range in days"
  default     = 2
}

variable "backup_frequency" {
  type        = string
  description = "Sets the backup frequency. Must be either Daily or Weekly"
  default     = "Daily"
}

variable "backup_time" {
  type        = string
  description = "The time of day to perform the backup in 24hour format"
  default     = "23:00"
}

variable "retention_daily_count" {
  type        = number
  description = "The number of daily backups to keep"
  default     = 10
}

variable "soft_delete_enabled" {
  type        = bool
  description = "soft delete is enabled?"
  default     = false
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
