module "lib"{
  source = "../_1-lib"
  tfsa = "${var.tfsa}"
  tfcnt = "${var.tfcnt}"
  ackey = "${var.ackey}"
}

module "411" {
  source = "../_411"
  env = "${var.env}"
  subnet = "${(var.hostname["subnet"])}"
}

data "azurerm_resource_group" "rgvm" {
  name = "000-MS-POC-RG-EASTUS"
}

#bootdiagnostisms
data "azurerm_storage_account" "sabdiag" {
  name = "bootdiagnostisms"
  resource_group_name = "BastionMS"
}