terraform {
  required_providers {
    powerdns = {
      source = "pan-net/powerdns"
    }
    vsphere = {
      source = "hashicorp/vsphere"
    }
  }
  required_version = ">= 0.13, < 0.14"
}
