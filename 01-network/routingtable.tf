
# Reference: https://docs.microsoft.com/en-us/azure/terraform/terraform-hub-spoke-hub-nva

# creating RT For A
resource "azurerm_route_table" "rta" {
  name                          = "rta"
  location                      = "${data.azurerm_resource_group.rgnet.location}"
  resource_group_name           = "${data.azurerm_resource_group.rgnet.name}"
  disable_bgp_route_propagation = false

  route {
    name                   = "${var.routetable ["rta_route1_name"]}"
    address_prefix         = "${var.routetable ["rta_route1_prefix"]}"
    next_hop_in_ip_address = "${var.routetable ["rta_route1_next_hop_ip"]}"
    next_hop_type          = "${var.routetable ["rta_route1_next_hop_type"]}"
  }

  tags = {
    environment = "Production"
  }
}

# creating RT For B 

resource "azurerm_route_table" "rtb" {
  name                          = "rtb"
  location                      = "${data.azurerm_resource_group.rgnet.location}"
  resource_group_name           = "${data.azurerm_resource_group.rgnet.name}"
  disable_bgp_route_propagation = false

  route {
    name                   = "${var.routetable ["rta_route2_name"]}"
    address_prefix         = "${var.routetable ["rta_route2_prefix"]}"
    next_hop_in_ip_address = "${var.routetable ["rta_route2_next_hop_ip"]}"
    next_hop_type          = "${var.routetable ["rta_route2_next_hop_type"]}"
  }

  tags = {
    environment = "Production"
  }
}