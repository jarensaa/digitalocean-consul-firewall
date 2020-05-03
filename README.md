# DigitalOcean Consul Server Firewall Module

Creates a standard firewall with ports open for a Consul server

Checkout [example](./example) for a fully functioning example.

## Environment Variables

- `DIGITALOCEAN_TOKEN`

## Input Variables

- `droplet_ids`: [Optional] List of droplet IDs to use firewall.
- `name`: [Optional] Name for resources, defaults to "consul-server-ports".
- `tags`: [Optional] List of tags to set on resources.

## Outputs

_None_

## Module Dependencies

_None_

## License

Mozilla Public License Version 2.0. See LICENSE for full details.
