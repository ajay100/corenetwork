
output "rg_name" {
    value = "${data.azurerm_resource_group.rgnet.name}"
}

### Output for vnetA

output "vnetA_id" {
    value = "${azurerm_virtual_network.vnetA.id}"
}

output "vnetA_name" {
    value = "${azurerm_virtual_network.vnetA.name}"
}

output "vnetA_subnet1_id" {
    value = "${azurerm_subnet.vnetA_subnet1.id}"
}
output "vnetA_subnet2_id" {
    value = "${azurerm_subnet.vnetA_subnet2.id}"
}

### Output for vnetB
output "vnetB_id" {
    value = "${azurerm_virtual_network.vnetB.id}"
}

output "vnetB_name" {
    value = "${azurerm_virtual_network.vnetB.name}"
}

output "vnetB_subnet1_id" {
    value = "${azurerm_subnet.vnetB_subnet1.id}"
}
output "vnetB_subnet2_id" {
    value = "${azurerm_subnet.vnetB_subnet2.id}"
}