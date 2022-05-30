  resource "azurerm_log_analytics_workspace" "logana1" {
    name                = var.name
    location            = var.location
    resource_group_name = var.resource_group_name
    sku                 = "PerGB2018"
    retention_in_days   = 30
}

#ENVOIE DE LOGS "Audit Event" AU LOG ANALYTICS grâce à 'diagnostic setting'

resource "azurerm_monitor_diagnostic_setting" "diag01" {
  name               = var.namelog
  target_resource_id = var.target_resource_id
  log_analytics_workspace_id = var.log_analytics_workspace_id

  log {
    category = "Metrics"
    enabled  = true

    retention_policy {
      enabled = false
    }
  }

}