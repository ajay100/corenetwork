provider azurerm {
  version         = "~> 1.23"
  tenant_id       = "${var.tenant_id}"
  subscription_id = "${var.subscription_id}"
  client_id       = "${var.client_id}"
  client_secret   = "${var.client_secret}"
}

variable "subscription_id" {
  description = "Enter Subscription ID for provisioning resources in Azure"
}

variable "client_id" {
  description = "Enter Client ID for Application created in Azure AD"
}

variable "client_secret" {
  description = "Enter Client secret for Application in Azure AD"
}

variable "tenant_id" {
  description = "Enter Tenant ID / Directory ID of your Azure AD. Run Get-AzureSubscription to know your Tenant ID"
}

variable "prefix" {
  default = "000"
}
variable "env" {
  default = "dev"
}

variable "eonid" {
  default = "000"
}

variable allow_rdp_traffic           {}
variable allow_ssh_traffic           {}

variable "allow_any_any_traffic"     {}
