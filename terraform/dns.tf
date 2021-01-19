resource "hetznerdns_zone" "xyz_cyanic" {
  name = "cyanic.xyz"
  ttl = 3600
}

resource "hetznerdns_record" "xyz_cyanic" {
  zone_id = hetznerdns_zone.xyz_cyanic.id
  name = "@"
  type = "A"
  value = hcloud_floating_ip.main.ip_address
  ttl = 60
}

resource "hetznerdns_record" "xyz_cyanic_wildcard" {
  zone_id = hetznerdns_zone.xyz_cyanic.id
  name = "*"
  type = "A"
  value = hcloud_floating_ip.main.ip_address
  ttl = 60
}

resource "hetznerdns_record" "xyz_cyanic_www" {
  zone_id = hetznerdns_zone.xyz_cyanic.id
  name = "www"
  type = "A"
  value = hcloud_floating_ip.main.ip_address
  ttl = 60
}

resource "hetznerdns_record" "xyz_cyanic_mail" {
  zone_id = hetznerdns_zone.xyz_cyanic.id
  name = "mail"
  type = "A"
  value = hcloud_floating_ip.main.ip_address
  ttl = 60
}

resource "hetznerdns_record" "xyz_cyanic_nc" {
  zone_id = hetznerdns_zone.xyz_cyanic.id
  name = "nc"
  type = "A"
  value = hcloud_floating_ip.main.ip_address
  ttl = 60
}

resource "hetznerdns_record" "xyz_cyanic_autodiscover" {
  zone_id = hetznerdns_zone.xyz_cyanic.id
  name = "autodiscover"
  type = "CNAME"
  value = "mail"
  ttl = 60
}

resource "hetznerdns_record" "xyz_cyanic_autoconfig" {
  zone_id = hetznerdns_zone.xyz_cyanic.id
  name = "autoconfig"
  type = "CNAME"
  value = "mail"
  ttl = 60
}

resource "hetznerdns_record" "xyz_cyanic_mx" {
  zone_id = hetznerdns_zone.xyz_cyanic.id
  name = "@"
  type = "MX"
  value = "10 mail"
  ttl = 60
}

resource "hetznerdns_record" "xyz_cyanic_mail_spf" {
  zone_id = hetznerdns_zone.xyz_cyanic.id
  name = "mail"
  type = "TXT"
  value = "v=spf1 redirect=cyanic.xyz"
  ttl = 60
}

resource "hetznerdns_record" "xyz_cyanic_spf" {
  zone_id = hetznerdns_zone.xyz_cyanic.id
  name = "@"
  type = "TXT"
  value = "v=spf1 mx a -all"
  ttl = 60
}

resource "hetznerdns_record" "xyz_cyanic_dmarc" {
  zone_id = hetznerdns_zone.xyz_cyanic.id
  name = "_dmarc"
  type = "TXT"
  value = "v=DMARC1; p=reject; rua=mailto:mailauth-reports@cyanic.xyz"
  ttl = 60
}

resource "hetznerdns_record" "xyz_cyanic_mg_spf" {
  zone_id = hetznerdns_zone.xyz_cyanic.id
  name = "mg"
  type = "TXT"
  value = "v=spf1 include:eu.mailgun.org ~all" 
  ttl = 60
}

resource "hetznerdns_record" "xyz_cyanic_mg_dkim" {
  zone_id = hetznerdns_zone.xyz_cyanic.id
  name = "mta._domainkey.mg"
  type = "TXT"
  value = "k=rsa; p=MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEA146Ds1TrDUUbRC+dU1JH6rwbB6VAhK6Ee1Kx1vkEBC93JRcL9Rq3jJ83jSVpw6vkrF5zlGmTyKf5wsGet99rMM2m4tJXy3sME5xL2QHtcmfbSQ4MqYIoaLVgCT7gQKNzYGfBv0g9bVoOz9X+zszZ9nX0g23UbXlwitiCNmtKgoxsye3/8UqwQxjoS2T16uCF2COjWABkNVaBQylkFtd/+PJn8xje06+mrgE6WO0/2Q9MDH3JNlP00HmJ0AmkSwf1cDyWNKVHQJklxcAHvYrHxSDgMG52IVEi0NwyeG/Rm9Gu7FL3j8CLqtzeP6qii/BLs0Yx395RfrL7R1X9ZePF5QIDAQAB"
  ttl = 60
}

resource "hetznerdns_record" "xyz_cyanic_mg_cname" {
  zone_id = hetznerdns_zone.xyz_cyanic.id
  name = "email.mg"
  type = "CNAME"
  value = "eu.mailgun.org"
  ttl = 60
}

resource "hetznerdns_record" "xyz_cyanic_dkim" {
  zone_id = hetznerdns_zone.xyz_cyanic.id
  name = "mta._domainkey"
  type = "TXT"
  value = "v=DKIM1;k=rsa;t=s;s=email;p=MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAzDZUj/R+ZV8oIdxo50coRljPvd8NRfNK2d2oikcClF9bdnnRO5NUsSN7kPO0AUQGOs3OVi6bqeBmADw0iz0gP5Jk0xlo1tQcY8yVt2sgln0tg0XjMDEgO/HbwGlXiV9M0fCPSkPCbtOrLFFSISsAJ/buOsGu6sRWE7JyjVx7l6P8Kg8UqXlyghpcFakei9u1w9PhjAANPJORoNNzmzohRuxyc64NKtrhlGZP9Iw2fkpAyJ4r/P4P06nAHOZxoRG7r4Z0nT11I/khUEiDzyxqh0PNMMCRi8dQooYcLv0xtgnzSVsVSrdTRPs4XC7FKC+f6AgShqujN2dOzeLmUiag8wIDAQAB" 
  ttl = 60
}

resource "hetznerdns_record" "xyz_cyanic_google_postmaster" {
  zone_id = hetznerdns_zone.xyz_cyanic.id
  name = "@"
  type = "TXT"
  value = "google-site-verification=2aWtkXQOdelc05GM5jLoKYP38bP8VQT9qyzK0TGjpmg"
  ttl = 60
}


resource "hetznerdns_zone" "uk_co_antweb" {
  name = "ant-web.co.uk"
  ttl = 3600
}

resource "hetznerdns_record" "uk_co_antweb_dmarc" {
  zone_id = hetznerdns_zone.uk_co_antweb.id
  name = "_dmarc"
  type = "TXT"
  value = "v=DMARC1; p=reject; rua=mailto:mailauth-reports@cyanic.xyz"
  ttl = 60
}

resource "hetznerdns_record" "uk_co_antweb_mx" {
  zone_id = hetznerdns_zone.uk_co_antweb.id
  name = "@"
  type = "MX"
  value = "10 mail.cyanic.xyz."
  ttl = 60
}

resource "hetznerdns_record" "uk_co_antweb_dkim" {
  zone_id = hetznerdns_zone.uk_co_antweb.id
  name = "cyanic._domainkey"
  type = "TXT"
  value = "v=DKIM1;k=rsa;t=s;s=email;p=MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEA5RKr9lFAvIylPPkqEsbXrQFoa14CZ5nWbJOy5k4OXSnnHEkkyj7JJjmeL1bUAtRsmeJitjfYSs1CTpyu/tf5f1PvqNQJZlgTYyo5gy1jAbjNHqfgcn5BpVE/SIUq55gghPf9ek9TWE13lcKvSWK47Ea2lznbGLm10yEMKrbfDICRNu0UlOhkMQaGJ0GGJavV45NDRvgtVxu/sC+/g3DXu2K6fq3CCm3fGEDc4N8UbvoG/1/7F2LdRyBQ9o/GKX/ozi1inJbDPDUXEL0wblrh6RdkTlEWNDj5F3s9WqOgKa36sRQxQbVoClulCLB4/P3YzimR36tJjpYOeuXJhc47HQIDAQAB"
  ttl = 60
}

resource "hetznerdns_record" "uk_co_antweb_spf" {
  zone_id = hetznerdns_zone.uk_co_antweb.id
  name = "@"
  type = "TXT"
  value = "v=spf1 redirect=cyanic.xyz"
  ttl = 60
}

resource "hetznerdns_record" "uk_co_antweb_keybase" {
  zone_id = hetznerdns_zone.uk_co_antweb.id
  name = "@"
  type = "TXT"
  value = "keybase-site-verification=tw3M7eJ24uxlQZKdrrLiXA4sgtiZLiCPG0GLZuK2wcg"
  ttl = 60
}

resource "hetznerdns_zone" "tech_antonyoneill" {
  name = "antonyoneill.tech"
  ttl = 3600
}

resource "hetznerdns_record" "tech_antonyoneill_keybase" {
  zone_id = hetznerdns_zone.tech_antonyoneill.id
  name = "@"
  type = "TXT"
  value = "keybase-site-verification=DGkaiNqi92eSBGIDeaqYZ-FcHNSTYGbur2HKpQWaMqo"
  ttl = 60
}

resource "hetznerdns_record" "tech_antonyoneill_dmarc" {
  zone_id = hetznerdns_zone.tech_antonyoneill.id
  name = "_dmarc"
  type = "TXT"
  value = "v=DMARC1; p=reject; rua=mailto:mailauth-reports@cyanic.xyz"
  ttl = 60
}

resource "hetznerdns_record" "tech_antonyoneill_mx" {
  zone_id = hetznerdns_zone.tech_antonyoneill.id
  name = "@"
  type = "MX"
  value = "10 mail.cyanic.xyz."
  ttl = 60
}

resource "hetznerdns_record" "tech_antonyoneill_spf" {
  zone_id = hetznerdns_zone.tech_antonyoneill.id
  name = "@"
  type = "TXT"
  value = "v=spf1 redirect=cyanic.xyz"
  ttl = 60
}

resource "hetznerdns_record" "tech_antonyoneill_dkim" {
  zone_id = hetznerdns_zone.tech_antonyoneill.id
  name = "cyanic._domainkey"
  type = "TXT"
  value = "v=DKIM1;k=rsa;t=s;s=email;p=MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEA5RKr9lFAvIylPPkqEsbXrQFoa14CZ5nWbJOy5k4OXSnnHEkkyj7JJjmeL1bUAtRsmeJitjfYSs1CTpyu/tf5f1PvqNQJZlgTYyo5gy1jAbjNHqfgcn5BpVE/SIUq55gghPf9ek9TWE13lcKvSWK47Ea2lznbGLm10yEMKrbfDICRNu0UlOhkMQaGJ0GGJavV45NDRvgtVxu/sC+/g3DXu2K6fq3CCm3fGEDc4N8UbvoG/1/7F2LdRyBQ9o/GKX/ozi1inJbDPDUXEL0wblrh6RdkTlEWNDj5F3s9WqOgKa36sRQxQbVoClulCLB4/P3YzimR36tJjpYOeuXJhc47HQIDAQAB"
  ttl = 60
}
