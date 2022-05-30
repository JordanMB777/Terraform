variable "name" {
  type = string
}

variable "resource_group_name" {
  type = string
  #default = "groupe-x"
}

variable "location" {
  type = string
}

variable "tenant_id" {
  type = string
}

variable "object_id" {
  type = string
}

variable "key_permissions" {
  type = list(string)
}

variable "secret_permissions" {
  type = list(string)
}

variable "storage_permissions" {
  type = list(string)
}