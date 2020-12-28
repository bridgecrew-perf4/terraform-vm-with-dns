### Data sources
variable "datacenter" {}

variable "resource_pool" {}

variable "datastore_cluster" {}

variable "network" {}

variable "template_name" {}

### VM vars

variable "vm_count" {}

variable "vm_name_prefix" {}

variable "num_cpus" {}

variable "memory" {}

variable "folder" {}

variable "annotation" {
  default = "-"
}

variable "wait_for_guest_net_timeout" {
  default = 3
}

variable "data_disks" {
  type        = map(map(string))
  default     = {}
}

variable "domain_name" {}

variable "ipv4_network_address" {}
variable "ipv4_address_pool" {}
variable "ipv4_gateway" {}
