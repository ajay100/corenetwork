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

variable tfsa {}
variable tfcnt {}
variable ackey {}



#####################################
variable "env" {
  default = "dev"
}

variable "eonid" {
  default = "12345"
}
variable "prefix" {
  default = ""
}


variable "hostname"{
  description = "VM name referenced also in storage-related names."
  type    = "map"
  default = {
  "0"     = ""
  "1"     = ""
  "2"     = ""
  "3"     = ""
  count   = ""
  ip      = ""
  sm      = ""
  vm_size = ""
  admin_username  = ""
  admin_password  = ""
  image_publisher = ""
  image_offer     = ""
  image_sku       = ""
  image_version   = ""
  vnet_name       = ""
  subnet          = ""
  }
 }

variable "admin_username" {
  description = "administrator user name"
  default = ""
}
variable "admin_password" {
  description = "administrator password"
  default = ""
}

# variable "subnets" {
#   type    = "list"
#   default = ["10.0.1.10","10.0.1.11"]
# }

# variable "resource_group" {
#   description = "The name of the resource group in which to create the virtual network."
#   default     = "canadaeast"
# }

# variable "rg_prefix" {
#   description = "The shortened abbreviation to represent your resource group that will go on the front of some resources."
#   default     = "rg"
# }

# variable "osdisk" {
#   description = "VM name referenced also in storage-related names."

#   default = {
#     "0" = "osdisk1"
#     "1" = "osdisk2"
#   }
# }

# variable "location" {
#   description = "The location/region where the virtual network is created. Changing this forces a new resource to be created."
#   default     = "canadaeast"
# }

# variable "virtual_network_name" {
#   description = "The name for the virtual network."
#   default     = "vnet"
# }

# variable "address_space" {
#   description = "The address space that is used by the virtual network. You can supply more than one address space. Changing this forces a new resource to be created."
#   default     = "10.0.0.0/16"
# }

# variable "subnet_prefix" {
#   description = "The address prefix to use for the subnet."
#   default     = "10.0.10.0/24"
# }

# variable "storage_account_tier" {
#   description = "Defines the Tier of storage account to be created. Valid options are Standard and Premium."
#   default     = "Standard"
# }

# variable "storage_replication_type" {
#   description = "Defines the Replication Type to use for this storage account. Valid options include LRS, GRS etc."
#   default     = "LRS"
# }

# variable "vm_size" {
#   description = "Specifies the size of the virtual machine."
#   default     = "Standard_DS3_v2"
# }

# variable "image_publisher" {
#   description = "name of the publisher of the image (az vm image list)"
#   default     = "OpenLogic"
# }

# variable "image_offer" {
#   description = "the name of the offer (az vm image list)"
#   default     = "CentOS"
# }

# variable "image_sku" {
#   description = "image sku to apply (az vm image list)"
#   default     = "7.3"
# }

# variable "image_version" {
#   description = "version of the image to apply (az vm image list)"
#   default     = "latest"
# }


# variable "tags" {
#   type = "map"

#   default {
#     environment = "Public Cloud"
#   }
# }
