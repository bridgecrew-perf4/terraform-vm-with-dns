module "vm_project_dev" {
  source = "./modules/vm-vsphere"
  for_each = local.project_dev["vms"]

  datacenter = var.datacenter
  resource_pool = var.resource_pool
  datastore_cluster = var.datastore_cluster
  network = var.network

  template_name = var.template_name

  vm_count = each.value["vm_count"]
  vm_name_prefix = "${var.vm_base_name}-${replace(each.key, "_", "-")}"
  domain_name = var.domain_name

  num_cpus = each.value["num_cpus"]
  memory = each.value["memory"]

  folder = var.folder
  tags = []
  custom_attributes = var.custom_attributes

  data_disks = {
    "disk1" = {
      "size_gb" = each.value["data_disk_size_gb"]
      "unit_number" = 1
    }
  }

  ipv4_network_address = local.project_dev["ipv4_network_address"]
  ipv4_address_pool = each.value["ipv4_address_pool"]
  ipv4_gateway = local.project_dev["ipv4_gateway"]

}

module "vm_dns_record" {
  source = "./modules/powerdns-record"
  for_each = {
    for vm in flatten([
      for vm_name, vm_param in local.project_dev["vms"] : [
        for ip_address in vm_param["ipv4_address_pool"] : {
          name = "${var.vm_base_name}-${replace(vm_name, "_", "-")}-${format("%02d", index(vm_param["ipv4_address_pool"], ip_address) + 1)}"
          ip_address = ip_address
        }
        if contains(keys(vm_param), "create_dns_records")
      ]
    ]) : "${vm.name}-${vm.ip_address}" => vm
  }

  name = each.value.name
  records = [ each.value.ip_address ]
}
