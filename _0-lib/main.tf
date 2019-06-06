########################################
#Get Config for Networking Resources
########################################

variable tfsa {}
variable tfcnt {}
variable ackey {}


### Ref to NSG
variable nsg_key {
  default = "csr/nsg/nsg.tfstate"
}

data "terraform_remote_state" "nsg_info" {
  backend = "azurerm"
    config {
    storage_account_name = "${var.tfsa}"
    container_name       = "${var.tfcnt}"
    key                  = "${var.nsg_key}"
    access_key           = "${var.ackey}"
  }
}

output "nsg_id" {
    value ="${data.terraform_remote_state.nsg_info.nsg_id}"
}
