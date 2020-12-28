locals {
  project_dev = {
    ipv4_network_address = "192.168.100.0/24"
    ipv4_gateway = "192.168.100.1"
    vms = {
      postgres = {
        vm_count = 2
        num_cpus = 4
        memory = 8192
        data_disk_size_gb = 20
        ipv4_address_pool = [
          "192.168.100.50",
          "192.168.100.51"
        ]
      }
      elastic_master = {
        vm_count = 1
        num_cpus = 2
        memory = 4096
        data_disk_size_gb = 20
        ipv4_address_pool = [
          "192.168.100.60"
        ]
      }
      elastic_node = {
        vm_count = 3
        num_cpus = 8
        memory = 16384
        data_disk_size_gb = 450
        ipv4_address_pool = [
          "192.168.100.65",
          "192.168.100.66",
          "192.168.100.67"
        ]
      }
      kafka = {
        vm_count = 3
        num_cpus = 4
        memory = 16384
        data_disk_size_gb = 50
        ipv4_address_pool = [
          "192.168.100.70",
          "192.168.100.71",
          "192.168.100.72"
        ],
        create_dns_records = true
      },
      kube_master = {
        vm_count = 1
        num_cpus = 2
        memory = 4096
        data_disk_size_gb = 20
        ipv4_address_pool = [
          "192.168.100.10"
        ]
      },
      kube_worker = {
        vm_count = 4
        num_cpus = 8
        memory = 8192
        data_disk_size_gb = 120
        ipv4_address_pool = [
          "192.168.100.15",
          "192.168.100.16",
          "192.168.100.17",
          "192.168.100.18"
        ]
      },
      kube_system = {
        vm_count = 2
        num_cpus = 2
        memory = 4096
        data_disk_size_gb = 80
        ipv4_address_pool = [
          "192.168.100.25",
          "192.168.100.26"
        ]
      },
      kube_front = {
        vm_count = 2
        num_cpus = 2
        memory = 4096
        data_disk_size_gb = 20
        ipv4_address_pool = [
          "192.168.100.30",
          "192.168.100.31"
        ]
      },
    }
  }
}
