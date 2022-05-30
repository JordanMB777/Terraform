variable "nic" {
  type    = string
  default = "nic-x"
}

variable "vname" {
  type    = string
  default = "vm-x"
}

variable "subnet_id" {
  type = string
}

variable "location" {
  type = string
}

variable "resource_group_name" {
  type = string
}

variable "network_interface_ids" {
  type = list(string)
}

variable "admin_username" {
  type = string
}

variable "storage_account_uri" {
  type = string
}