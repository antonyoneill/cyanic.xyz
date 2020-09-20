resource "hetznerdns_zone" "default" {
  name = "cyanic.xyz"
  ttl = 3600
}

resource "hetznerdns_record" "root" {
  zone_id = hetznerdns_zone.default.id
  name = "@"
  type = "A"
  value = hcloud_floating_ip.main.ip_address
  ttl = 60
}

resource "hetznerdns_record" "web" {
  zone_id = hetznerdns_zone.default.id
  name = "www"
  type = "A"
  value = hcloud_floating_ip.main.ip_address
  ttl = 60
}

resource "hetznerdns_record" "mail" {
  zone_id = hetznerdns_zone.default.id
  name = "mail"
  type = "A"
  value = hcloud_floating_ip.main.ip_address
  ttl = 60
}

resource "hetznerdns_record" "autodiscover" {
  zone_id = hetznerdns_zone.default.id
  name = "autodiscover"
  type = "CNAME"
  value = "mail"
  ttl = 60
}

resource "hetznerdns_record" "autoconfig" {
  zone_id = hetznerdns_zone.default.id
  name = "autoconfig"
  type = "CNAME"
  value = "mail"
  ttl = 60
}

resource "hetznerdns_record" "mx" {
  zone_id = hetznerdns_zone.default.id
  name = "@"
  type = "MX"
  value = "10 mail"
  ttl = 60
}

resource "hetznerdns_record" "spf" {
  zone_id = hetznerdns_zone.default.id
  name = "@"
  type = "TXT"
  value = "v=spf1 mx a -all"
  ttl = 60
}

resource "hetznerdns_record" "dmarc" {
  zone_id = hetznerdns_zone.default.id
  name = "_dmarc"
  type = "TXT"
  value = "v=DMARC1; p=reject; rua=mailto:mailauth-reports@cyanic.xyz"
  ttl = 60
}

