#Lancement du provider
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "2.98.0"
    }
  }
}

# Configure the Microsoft Azure Provider
provider "azurerm" {
  features {}
}

#RANDOM PASSWORD
resource "random_password" "password" {
  length           = 16
  min_numeric      = 1
  min_lower        = 1
  min_upper        = 1
  min_special      = 1
  special          = true
  override_special = "!#$%&"
}

# Création du resource groupe

module "RG" {
  source   = "../Projet/Modules/RG"
  name     = var.name
  location = var.location
}

#Création du Keyvault avec droits Secrets au group_controle

module "KV" {
  source              = "../Projet/Modules/KV"
  name                = "kv-x"
  location            = var.location
  resource_group_name = module.RG.name
  tenant_id           = data.azurerm_client_config.current.tenant_id
  object_id           = data.azurerm_client_config.current.object_id
  key_permissions     = []
  secret_permissions = [
    "Get",
  ]
  storage_permissions = []
}

#Création du VNET et 2 SUBNET

module "VNET" {
  source               = "../Projet/Modules/VNET"
  name                 = "vnet-x"
  address_space        = ["10.0.0.0/16"]
  location             = var.location
  resource_group_name  = module.RG.name
  virtual_network_name = module.VNET.vnet_name
}

#Création du MSSQL

module "SQL" {
  source                       = "../Projet/Modules/SQL"
  name                         = "sql-x"
  resource_group_name          = module.RG.name
  location                     = var.location
  administrator_login          = "Test-x"
  administrator_login_password = random_password.password.result
}

# Création d'une Database

module "DB" {
  source                      = "../Projet/Modules/DB"
  name                        = "db-x"
  server_id                   = module.SQL.id
  max_size_gb                 = 20
  auto_pause_delay_in_minutes = 90
}

# Création du storage account + FW et Container

module "SA" {
  source                     = "../Projet/Modules/SA"
  resource_group_name        = module.RG.name
  location                   = var.location
  ip_rules                   = ["78.192.36.138"]
  virtual_network_subnet_ids = ["10.0.1.0/24", "10.0.2.0/24"]
  storage_account_name       = module.SA.name
}

#GENERER UNE SAS KEY

output "sas_url_query_string" {
  sensitive = true
  value     = nonsensitive("https://${module.SA.name}.blob.core.window.net/${data.azurerm_storage_account_sas.key.sas}")
}

#Log Analytics

module "LOG" {
  source                     = "../Projet/Modules/LOG"
  location                   = var.location
  resource_group_name        = module.RG.name
  target_resource_id         = module.KV.kvid
  log_analytics_workspace_id = module.LOG.LOG_id
}

#VM UBUNTU

module "VM" {
  source                = "../Projet/Modules/VM"
  location              = var.location
  resource_group_name   = module.RG.name
  admin_username        = "userxadm"
  subnet_id             = module.VNET.subnet_id
  network_interface_ids = module.VM.nic_id
  storage_account_uri   = module.SA.blob

}