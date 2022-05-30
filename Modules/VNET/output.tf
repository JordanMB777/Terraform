output "vnet_name" {
  value = azurerm_virtual_network.vnet01.name
}

output "subnet_id" {
  value = azurerm_subnet.sub1[0].id
}