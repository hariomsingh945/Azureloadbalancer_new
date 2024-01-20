resource "azurerm_network_security_group" "security_example" {
  for_each            = var.securitygroup
  name                = each.value.name
  location            = each.value.location
  resource_group_name = each.value.rg_name

   security_rule {
    name                       = "test123"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range         = "*"
    destination_port_range     = "*"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
}
