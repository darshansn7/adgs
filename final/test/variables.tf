################################################
#    GENERAL PREFIX VARIABLES
################################################

variable "client_name" {
  description = "Client Short Name"
  type        = string
  default     = "irg"
}

variable "location" {
  description = "Location"
  type        = string
  default     = "us"
}

variable "project_name" {
  description = "Project short name"
  type        = string
  default     = "co"
}

variable "environment" {
  description = "Environment short name"
  type        = string
  default     = "d"
}

variable "cloud_type" {
  description = "Cloud provider"
  type        = string
  default     = "a"
}


################################################
#    GENERAL TAGS VARIABLES
################################################

variable "sub_request_id" {
  type    = string
  default = "201"
}

variable "product_type" {
  type    = string
  default = "Solutions.AI"
}

variable "solution_name" {
  type    = string
  default = "IRG"
}

variable "enagagement_name" {
  type    = string
  default = "Data and Analytics"
}

variable "sensitivity" {
  type    = string
  default = "Non-Sensitive"
}

variable "provisioned_by" {
  type    = string
  default = "System Generated"
}

variable "service_group" {
  type    = string
  default = "Development Hub Services"
}

variable "service_name" {
  type    = string
  default = "Data Pipeline"
}

variable "purpose" {
  type    = string
  default = "AIP"
}

