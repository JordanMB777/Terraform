resource "azurerm_mssql_database" "test" {
  name                        = var.name
  server_id                   = var.server_id
  collation                   = "SQL_Latin1_General_CP1_CI_AS"
  license_type                = "LicenseIncluded"
  max_size_gb                 = var.max_size_gb
  read_scale                  = true
  sku_name                    = "BC_Gen5_2"
  zone_redundant              = true
  auto_pause_delay_in_minutes = var.auto_pause_delay_in_minutes
}