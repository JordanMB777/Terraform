resource "azurerm_storage_account" "STO1" {
  name                     = "sa442"
  resource_group_name      = var.resource_group_name
  location                 = var.location
  account_tier             = "Standard"
  account_replication_type = "LRS"

  network_rules {
    default_action             = "Deny"
    ip_rules                   = var.ip_rules
    virtual_network_subnet_ids = var.virtual_network_subnet_ids
  }
}

resource "azurerm_storage_container" "Container1" {
  name                  = "cont-x"
  storage_account_name  = var.storage_account_name
  container_access_type = "private"
}

