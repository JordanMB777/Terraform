#Création du Groupe de Ressources

resource "azurerm_resource_group" "Groupe1" {
  name     = var.name
  location = var.location
}