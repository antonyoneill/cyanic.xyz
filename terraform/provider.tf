terraform {
  required_providers {
    hcloud = {
      source = "hetznercloud/hcloud"
      version = "1.21.0"
    }
    hetznerdns = {
      source = "timohirt/hetznerdns"
      version = "1.1.1"
    }
  }
}

variable "hetzner_cloud_token" {}
variable "hetzner_dns_token" {}

provider "hcloud" {
  token = var.hetzner_cloud_token
}

provider "hetznerdns" {
  apitoken = var.hetzner_dns_token
}

provider "aws" {
  region = "eu-west-2"
}
