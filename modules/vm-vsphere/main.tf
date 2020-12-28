resource "vsphere_virtual_machine" "vm_vsphere" {
  lifecycle {
    ignore_changes = [
      disk[0],
      clone[0].customize,
      wait_for_guest_net_timeout,
      cdrom,
      cdrom[0],
      ide_controller_count,
      poweron_timeout,
      sata_controller_count
    ]
  }

  count                       = var.vm_count
  name                        = "${var.vm_name_prefix}-${format("%02d", count.index + 1)}"
  firmware                    = "efi"
  num_cpus                    = var.num_cpus
  memory                      = var.memory
  folder                      = var.folder

  wait_for_guest_net_timeout  = var.wait_for_guest_net_timeout

  annotation                  = var.annotation

  guest_id                    = data.vsphere_virtual_machine.template.guest_id
  resource_pool_id            = data.vsphere_resource_pool.pool.id
  datastore_cluster_id        = data.vsphere_datastore_cluster.ds.id


  network_interface {
    network_id   = data.vsphere_network.network.id
    adapter_type = data.vsphere_virtual_machine.template.network_interface_types[0]
  }

  disk {
    label = "disk0"
    size  = data.vsphere_virtual_machine.template.disks.0.size
  }

  dynamic "disk" {
    for_each = var.data_disks
    iterator = terraform_disk
    content {
      label            = terraform_disk.key
      size             = lookup(terraform_disk.value, "size_gb", null)
      unit_number      = lookup(terraform_disk.value, "unit_number")
    }
  }

  clone {
    template_uuid = data.vsphere_virtual_machine.template.id

    customize {
      linux_options {
        host_name = "${var.vm_name_prefix}-${format("%02d", count.index + 1)}"
        domain    = var.domain_name
      }

      network_interface {
        ipv4_address = var.ipv4_address_pool[count.index]
        ipv4_netmask = element(split("/", var.ipv4_network_address), 1)
      }

      ipv4_gateway    = var.ipv4_gateway
    }
  }
}
