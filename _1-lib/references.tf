########################################
#Get Config for Networking Resources
########################################

variable tfsa {}
variable tfcnt {}
variable ackey {}


### Ref to Network
variable net_key {
  default = "csr/network/network.tfstate"
}

data "terraform_remote_state" "network_info" {
  backend = "azurerm"
    config {
    storage_account_name = "${var.tfsa}"
    container_name       = "${var.tfcnt}"
    key                  = "${var.net_key}"
    access_key           = "${var.ackey}"
  }
}

