variable "name" {
  description = "Name for resources, defaults to \"consul-server-ports\"."
  default     = "consul-server-ports"
}

variable "droplet_ids" {
  description = "The IDs of the droplets attached to the firewall"
  type = list(string)
}

variable "tags" {
  description = "Optional set of tags to set on resources, defaults to empty map."
  type        = list(string)
  default     = []
}
