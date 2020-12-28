provider "vsphere" {
  vsphere_server = var.vsphere_server
  user           = var.vsphere_user
  password       = var.vsphere_password
}

provider "powerdns" {
  server_url     = var.powerdns_server_url
  api_key        = var.powerdns_api_key
}
