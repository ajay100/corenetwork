output "vnetB_id" {
    value ="${data.terraform_remote_state.network_info.vnetB_id}"
}


output "vnetB_name" {
    value = "${data.terraform_remote_state.network_info.vnetB_name}"
}

output "vnetB_subnet1_id" {
    value = "${data.terraform_remote_state.network_info.vnetB_subnet1_id}"
}
output "vnetB_subnet2_id" {
    value = "${data.terraform_remote_state.network_info.vnetB_subnet2_id}"
}