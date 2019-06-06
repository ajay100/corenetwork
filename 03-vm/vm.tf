


resource "azurerm_virtual_machine" "hostname" {
  count               =  "${var.hostname ["count"]}"
  # lifecycle {
  # ignore_changes = ["availability_zone","tags"]
  # }
  name                  = "${lookup(var.hostname, count.index)}"
  location              = "${data.azurerm_resource_group.rgvm.location}"
  resource_group_name   = "${data.azurerm_resource_group.rgvm.name}"
  network_interface_ids = [
                           "${azurerm_network_interface.NIC-1.*.id[count.index]}"
                          ]
  #primary_network_interface_id = "${azurerm_network_interface.NIC-1.id}"

  vm_size               =  "${var.hostname ["vm_size"]}"

  availability_set_id  = "${count.index < 2 ? azurerm_availability_set.csr_avset-1.id : azurerm_availability_set.csr_avset-2.id}"

  # Uncomment this line to delete the OS disk automatically when deleting the VM
  delete_os_disk_on_termination = true

  # Uncomment this line to delete the data disks automatically when deleting the VM
  delete_data_disks_on_termination = true

  storage_image_reference {
    publisher = "${var.hostname ["image_publisher"]}"
    offer     = "${var.hostname ["image_offer"]}"
    sku       = "${var.hostname ["image_sku"]}"
    version   = "${var.hostname ["image_version"]}"
  }

  storage_os_disk {
    name              = "${lookup(var.hostname, count.index)}-os_disk"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }

  os_profile {
    computer_name  = "${lookup(var.hostname, count.index)}"
    admin_username = "${var.hostname["admin_username"]}"
    admin_password = "${var.hostname["admin_password"]}"
  }

  os_profile_linux_config {
    disable_password_authentication = false
  }
    # https://docs.microsoft.com/en-us/azure/virtual-machines/linux/terraform-create-complete-vm
    # will use existing one ==> bootdiagnostisms
      boot_diagnostics {
        enabled     = "true"
        storage_uri = "${data.azurerm_storage_account.sabdiag.primary_blob_endpoint}"
    }

    tags = {
    environment = "${var.env}"
    EONID = "${var.eonid}"
  }
}
