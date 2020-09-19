resource "hetznerdns_zone" "default" {
  name = "cyanic.xyz"
  ttl = 3600
}

resource "hetznerdns_record" "web" {
  zone_id = hetznerdns_zone.default.id
  name = "www"
  value = hcloud_floating_ip.main.ip_address
  type = "A"
  ttl = 60
}
