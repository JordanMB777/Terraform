
variable "ip_rules" {
  type = list(string)
}

variable "location" {
  type = string
}

variable "virtual_network_subnet_ids" {
  type = list(string)
}

variable "resource_group_name" {
  type = string
}

variable "storage_account_name" {
  type = string
}