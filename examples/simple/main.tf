
resource "digitalocean_droplet" "web" {
  name = "consul-ports-simple-example"
  size   = "s-1vcpu-1gb"
  image  = "ubuntu-18-04-x64"
  region = "fra1"
  count = 2
}

resource "digitalocean_tag" "foo" {
  name = "foo"
}

resource "digitalocean_tag" "bar" {
  name = "bar"
}

module "consul_client_ports_do" {
  source = "../../consul-client-ports-do"

  droplet_ids = digitalocean_droplet.web.*.id
  tags        = [digitalocean_tag.foo.name, digitalocean_tag.bar.name]
}
