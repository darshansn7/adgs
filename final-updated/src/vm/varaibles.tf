variable "virtual_machine_name" {
  type        = string
  description = "virtual machine name"
  default     = ""
}

variable "rg_location" {
  type        = string
  description = "resource group location"
  default     = "eastus"
}

variable "vm_rg" {
  type        = string
  description = "virtual machine resource group name"
  default     = ""
}

variable "network_interface_ids" {
  type    = list(string)
  default = [""]
}

variable "primary_network_interface_id" {
  type    = string
  default = ""
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

variable "key_data" {
  type        = string
  description = "key-data"
  default     = ""
}

variable "vm_computer_name" {
  type        = string
  description = "virtual machine computer name"
  default     = ""
}

variable "vm_admin_username" {
  type        = string
  description = "virtual machine admin user name"
  default     = ""
}

variable "vm_admin_password" {
  type        = string
  description = "virtual machine admin password"
  default     = ""
}

