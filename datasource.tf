data "azurerm_client_config" "current" {}


#GENERER UN SAS KEY AU NIVEAU DU CONTENEUR OU STORAGE ACCOUNT
# TOUT LES DROITS A AJOUTER
## FAIRE UN OUTPUT DE L URL KEY


data "azurerm_storage_account_sas" "key" {
  connection_string = module.SA.primary
  https_only        = true
  signed_version    = "2017-07-29"

  resource_types {
    service   = true
    container = true
    object    = true
  }

  services {
    blob  = true
    queue = true
    table = true
    file  = true
  }

  start  = "2018-03-21T00:00:00Z"
  expiry = "2023-03-21T00:00:00Z"

  permissions {
    read    = true
    write   = true
    delete  = true
    list    = true
    add     = true
    create  = true
    update  = true
    process = true
    #tag     = true
    #filter  = true
  }
}