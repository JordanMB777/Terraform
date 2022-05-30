output "name" {
  value = azurerm_storage_account.STO1.name
}

output "connection" {
  value = azurerm_storage_account.STO1.primary_connection_string
}

output "blob"{
  value = azurerm_storage_account.STO1.primary_blob_endpoint
}