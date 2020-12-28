### Providers

# Vsphere
variable "vsphere_server" {
  type = string
}

variable "vsphere_user" {
  type = string
}
variable "vsphere_password" {
  type = string
}

# Powerdns
variable "powerdns_server_url" {
  type = string
}

variable "powerdns_api_key" {
  type = string
}

### Envs variables

variable "tags" {
  type = list(string)
  default = []
}

variable "custom_attributes" {
  type = map(string)
  default = {}
}

variable "folder" {
  type = string
}

variable "domain_name" {
  type = string
}

variable "vm_base_name" {
  type = string
}

variable "resource_pool" {
  type = string
}

variable "network" {
  type = string
}

variable "datastore_cluster" {
  type = string
}

variable "datacenter" {
  type = string
}

variable "template_name" {
  type = string
}
