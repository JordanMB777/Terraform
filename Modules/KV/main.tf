#Création Keyvault
resource "azurerm_key_vault" "kv01" {
  name                        = var.name
  resource_group_name         = var.resource_group_name
  location                    = var.location
  enabled_for_disk_encryption = true
  tenant_id                   = var.tenant_id
  soft_delete_retention_days  = 7
  purge_protection_enabled    = false

  sku_name                    = "standard"

  access_policy {
    tenant_id                   = var.tenant_id
    object_id                   = var.object_id
    key_permissions             = var.key_permissions
    secret_permissions          = var.secret_permissions
    storage_permissions         = var.storage_permissions
  }
}