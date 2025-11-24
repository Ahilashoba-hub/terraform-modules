variable "dns_zone_name" {
  description = "The name of the DNS zone (e.g., example.com)"
  type        = string
  default     = "techiepro.shop"
}

variable "resource_group_name" {
  description = "The name of the resource group"
  type        = string
}

variable "public_ip_address" {
  description = "Public IP address to associate with the DNS A record"
  type        = string
}
