### CSR NSG

data "azurerm_resource_group" "rgnet" {
  name = "000-MS-POC-RG-EASTUS"
}
resource "azurerm_network_security_group" "csr-nsg-1" {
  name                = "csr-nsg"
  location            = "${data.azurerm_resource_group.rgnet.location}"
  resource_group_name = "${data.azurerm_resource_group.rgnet.name}"
}

resource "azurerm_network_security_rule" "security_rule_rdp" {
  count                       = "${var.allow_rdp_traffic ? 1 : 0 }"
  name                        = "rdp"
  priority                    = 102
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "3389"
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
  resource_group_name = "${data.azurerm_resource_group.rgnet.name}"
  network_security_group_name = "${azurerm_network_security_group.csr-nsg-1.name}" 
}

resource "azurerm_network_security_rule" "security_rule_ssh" {
  count                       = "${var.allow_ssh_traffic ? 1 : 0 }"
  name                        = "ssh"
  priority                    = 103
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "22"
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
  resource_group_name = "${data.azurerm_resource_group.rgnet.name}"
  network_security_group_name = "${azurerm_network_security_group.csr-nsg-1.name}" 
}

#allow_any_any_traffic
resource "azurerm_network_security_rule" "security_rule_any_any" {
  count                       = "${var.allow_any_any_traffic ? 1 : 0 }"
  name                        = "PermitAnyAny"
  priority                    = 103
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "*"
  source_port_range           = "*"
  destination_port_range      = "*"
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
  resource_group_name = "${data.azurerm_resource_group.rgnet.name}"
  network_security_group_name = "${azurerm_network_security_group.csr-nsg-1.name}" 
}