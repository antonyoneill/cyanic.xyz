resource "hcloud_network" "private" {
  name = "private"
  ip_range = "10.0.0.0/24"
}

resource "hcloud_network_subnet" "default" {
  network_id = hcloud_network.private.id
  type = "cloud"
  network_zone = "eu-central"
  ip_range = "10.0.0.0/24"
}

resource "hcloud_server" "cyanic" {
  name = "cyanic"
  image = "debian-10"
  server_type = "cx31"
  ssh_keys = [ hcloud_ssh_key.default.id ]
}

resource "hcloud_server_network" "cyanic" {
  server_id = hcloud_server.cyanic.id
  subnet_id = hcloud_network_subnet.default.id
}

resource "hcloud_floating_ip" "main" {
  type = "ipv4"
  home_location = "hel1"
}

resource "hcloud_floating_ip_assignment" "cyanic" {
  floating_ip_id = hcloud_floating_ip.main.id
  server_id = hcloud_server.cyanic.id
}

resource "hcloud_ssh_key" "default" {
  name = "Antony Public Key"
  public_key = file("${path.module}/id_rsa.pub")
}

resource "hcloud_rdns" "cyanic" {
  floating_ip_id = hcloud_floating_ip.main.id
  ip_address = hcloud_floating_ip.main.ip_address
  dns_ptr = "mail.cyanic.xyz"
}
