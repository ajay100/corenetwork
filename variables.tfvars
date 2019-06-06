
# Ref:
# https://docs.microsoft.com/en-us/azure/virtual-machines/linux/terraform-create-complete-vm
# https://github.com/terraform-providers/terraform-provider-azurerm/issues/1314

tfsa   = "terraformstatems"
tfcnt  = "tf-state-dev"
ackey  = ""

prefix      = "000poc"
app_name    = "csr"
networkEnv  = "dev"
location    = "eastus"
env         = "dev"
eonid = 12345

allow_rdp_traffic     = "false"
allow_ssh_traffic     = "false"
allow_any_any_traffic = "true"


hostname {
    "0"             = "VM-VNETA-1"
    "1"             = "VM-VNETA-2"
    "2"             = "VM-VNETB-1"
    "3"             = "VM-VNETB-2"
    count           = 4
    ip              = "10.100.0.4,10.100.1.4,10.101.0.4,10.101.1.4"
    vm_size         = "Standard_D3_v2"    #"Standard_E16s_v3"
    admin_username  = "labadmin"
    admin_password  = "Azure123456789O"
    image_publisher = "Canonical"
    image_offer     = "UbuntuServer"
    image_sku       = "16.04-LTS"
    image_version   = "latest"
    vnet_name       = "vneta"
    subnet          = "subnet"
}

routetable {
    rta_route1_name          = "intervnet"
    rta_route1_prefix        = "10.0.0.0/8"
    rta_route1_next_hop_ip   = "10.100.1.100"

    rta_route2_name          = "intervnet"
    rta_route2_prefix        = "10.0.0.0/8"
    rta_route2_next_hop_ip   = "10.101.1.100"
}


#### MetaData

# root@VM-VNETA-1:~# curl -H Metadata:true "http://169.254.169.254/metadata/instance?api-version=2017-12-01"
# {"compute":{"location":"eastus","name":"VM-VNETA-1","offer":"UbuntuServer","osType":"Linux","placementGroupId":"","platformFaultDomain":"1","platformUpdateDomain":"1","publisher":"Canonical","resourceGroupName":"000-MS-POC-RG-EASTUS","sku":"16.04-LTS","subscriptionId":"44c8c436-91c2-4b6b-8497-71b197a6fe5f","tags":"EONID:12345;environment:dev","version":"16.04.201905140","vmId":"087ca3b4-6f73-4266-bb7b-3179812ce3c5","vmScaleSetName":"","vmSize":"Standard_D3_v2","zone":""},"network":{"interface":[{"ipv4":{"ipAddress":[{"privateIpAddress":"10.100.0.4","publicIpAddress":"40.80.151.21"}],"subnet":[{"address":"10.100.0.0","prefix":"24"}]},"ipv6":{"ipAddress":[]},"macAddress":"000D3A538F43"}]}}root@VM-VNETA-1:~#