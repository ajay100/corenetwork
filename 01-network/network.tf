module "lib"{
  source = "../_0-lib"
  tfsa = "${var.tfsa}"
  tfcnt = "${var.tfcnt}"
  ackey = "${var.ackey}"
}

data "azurerm_resource_group" "rgnet" {
  name = "000-MS-POC-RG-EASTUS"
}

### Creating vnetA
resource "azurerm_virtual_network" "vnetA" {
  name                = "vnetA"
  address_space       = ["10.100.0.0/16"]
  location            = "${data.azurerm_resource_group.rgnet.location}"
  resource_group_name = "${data.azurerm_resource_group.rgnet.name}"
  #dns_servers         = ["10.0.0.4", "10.0.0.5"]  
  #   ddos_protection_plan {
  #   id     = "${azurerm_ddos_protection_plan.test.id}"
  #   enable = true
  # }
    tags = {
    environment = "${var.env}"
    EONID = "${var.eonid}"
  }
}

resource "azurerm_subnet" "vnetA_subnet1" {
  name                 = "subnet1"
  resource_group_name = "${data.azurerm_resource_group.rgnet.name}"
  virtual_network_name = "${azurerm_virtual_network.vnetA.name}"
  address_prefix       = "10.100.0.0/24"
  network_security_group_id = "${module.lib.nsg_id}"
}

resource "azurerm_subnet" "vnetA_subnet2" {
  name                 = "subnet2"
  resource_group_name = "${data.azurerm_resource_group.rgnet.name}"
  virtual_network_name = "${azurerm_virtual_network.vnetA.name}"
  address_prefix       = "10.100.1.0/24"
  network_security_group_id = "${module.lib.nsg_id}"
  route_table_id            = "${azurerm_route_table.rta.id}"
}


### Creating vnetB

resource "azurerm_virtual_network" "vnetB" {
  name                = "vnetB"
  address_space       = ["10.101.0.0/16"]
  location            = "${data.azurerm_resource_group.rgnet.location}"
  resource_group_name = "${data.azurerm_resource_group.rgnet.name}"
    
    tags = {
    environment = "${var.env}"
    EONID = "${var.eonid}"
  }
}

resource "azurerm_subnet" "vnetB_subnet1" {
  name                 = "subnet1"
  resource_group_name = "${data.azurerm_resource_group.rgnet.name}"
  virtual_network_name = "${azurerm_virtual_network.vnetB.name}"
  address_prefix       = "10.101.0.0/24"
  network_security_group_id = "${module.lib.nsg_id}"
}

resource "azurerm_subnet" "vnetB_subnet2" {
  name                 = "subnet2"
  resource_group_name = "${data.azurerm_resource_group.rgnet.name}"
  virtual_network_name = "${azurerm_virtual_network.vnetB.name}"
  address_prefix       = "10.101.1.0/24"
  network_security_group_id = "${module.lib.nsg_id}"
  route_table_id            = "${azurerm_route_table.rtb.id}"
}

