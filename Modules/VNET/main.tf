#CREER 1 VNET

resource "azurerm_virtual_network" "vnet01" {
  name                = var.name
  address_space       = var.address_space
  location            = var.location
  resource_group_name = var.resource_group_name

}

#CREER 2 SUBNET

resource "azurerm_subnet" "sub1" {
  count                                          = 2
  name                                           = "gsub-${count.index}"
  resource_group_name                            = var.resource_group_name
  virtual_network_name                           = var.virtual_network_name
  address_prefixes                               = ["10.0.${count.index}.0/24"]
  enforce_private_link_endpoint_network_policies = true
  service_endpoints                              = ["Microsoft.keyvault", "Microsoft.storage"]

}