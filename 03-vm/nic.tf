resource "azurerm_network_interface" "NIC-1" {
  count               = "${var.hostname ["count"]}"
  name                = "${lookup(var.hostname, count.index)}-NIC-1"
  location            = "${data.azurerm_resource_group.rgvm.location}"
  resource_group_name = "${data.azurerm_resource_group.rgvm.name}"
  enable_accelerated_networking = true

  ip_configuration {
    name                          = "csrvmvneta${count.index+1}"
    subnet_id                     = "${element(module.411.subnet_id, count.index)}"
    private_ip_address_allocation = "static"
    private_ip_address            = "${element(split(",", var.hostname ["ip"]), count.index)}"
    #private_ip_address           =   #"${cidrhost("var.subnets[vnetA_sm1]",4)}"  #"${cidrhost("10.100.0.0/24", 4)}"  #"10.100.0.4"   
    #public_ip_address_id         = "${azurerm_public_ip.test.id}"
    #primary = true
  }
    tags = {
    environment = "${var.env}"
    EONID = "${var.eonid}"
  }
  
}
# resource "azurerm_network_interface" "NIC-2" {
#   count               = "${var.hostname ["count"]}"
#   name                = "${lookup(var.hostname, count.index)}-NIC-2"
#   location            = "${data.azurerm_resource_group.rgvm.location}"
#   resource_group_name = "${data.azurerm_resource_group.rgvm.name}"
#   enable_accelerated_networking = true

#   ip_configuration {
#     name                          = "csrvmvneta${count.index+1}"
#     subnet_id                     = "${module.lib.vnetA_subnet2_id}"
#     private_ip_address_allocation = "static"
#     private_ip_address            =  "10.100.1.4"    
#   }
#     tags = {
#     environment = "${var.env}"
#     EONID = "${var.eonid}"
#   } 
# }