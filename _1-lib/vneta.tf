output "vnetA_id" {
    value ="${data.terraform_remote_state.network_info.vnetA_id}"
}


output "vnetA_name" {
    value = "${data.terraform_remote_state.network_info.vnetA_name}"
}

output "vnetA_subnet1_id" {
    value = "${data.terraform_remote_state.network_info.vnetA_subnet1_id}"
}
output "vnetA_subnet2_id" {
    value = "${data.terraform_remote_state.network_info.vnetA_subnet2_id}"
}
