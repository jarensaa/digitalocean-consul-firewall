terraform {
  required_version = ">= 0.12.24"
}

resource "digitalocean_firewall" "web" {
  name = var.name

  droplet_ids = var.droplet_ids
  tags = var.tags

  # DNS: The DNS server (TCP and UDP)
  inbound_rule {
    protocol         = "tcp"
    port_range       = "8600"
    source_addresses = ["0.0.0.0/0", "::/0"]
  }

  inbound_rule {
    protocol         = "udp"
    port_range       = "8600"
    source_addresses = ["0.0.0.0/0", "::/0"]
  }

  # HTTP: The HTTP API (TCP Only)
  inbound_rule {
    protocol         = "tcp"
    port_range       = "8500"
    source_addresses = ["0.0.0.0/0", "::/0"]
  }

  # HTTPS: The HTTPs API
  inbound_rule {
    protocol         = "tcp"
    port_range       = "8501"
    source_addresses = ["0.0.0.0/0", "::/0"]
  }

  # LAN Serf: The Serf LAN port (TCP and UDP)
  inbound_rule {
    protocol         = "tcp"
    port_range       = "8301"
    source_addresses = ["0.0.0.0/0", "::/0"]
  }

  inbound_rule {
    protocol         = "udp"
    port_range       = "8301"
    source_addresses = ["0.0.0.0/0", "::/0"]
  }

  # Wan Serf: The Serf WAN port (TCP and UDP)
  inbound_rule {
    protocol         = "tcp"
    port_range       = "8302"
    source_addresses = ["0.0.0.0/0", "::/0"]
  }

  inbound_rule {
    protocol         = "udp"
    port_range       = "8302"
    source_addresses = ["0.0.0.0/0", "::/0"]
  }

  # Sidecar proxy
  inbound_rule {
    protocol         = "tcp"
    port_range       = "21000-21255"
    source_addresses = ["0.0.0.0/0", "::/0"]
  }

  # All outbound traffic - TCP.
  outbound_rule {
    protocol              = "tcp"
    port_range            = "1-65535"
    destination_addresses = ["0.0.0.0/0", "::/0"]
  }

  # All outbound traffic - UDP.
  outbound_rule {
    protocol              = "udp"
    port_range            = "1-65535"
    destination_addresses = ["0.0.0.0/0", "::/0"]
  }
}
