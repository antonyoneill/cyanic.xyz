terraform {
  required_providers {
    hcloud = {
      source = "hetznercloud/hcloud"
      version = "1.21.0"
    }
  }
}

variable "hcloud_token" {}

provider "hcloud" {
  token = var.hcloud_token
}


