resource "azurerm_dns_zone" "example" {
  name                = var.dns_zone_name
  resource_group_name = var.resource_group_name
}

resource "azurerm_dns_a_record" "example" {
  name                = "www"
  zone_name           = azurerm_dns_zone.example.name
  resource_group_name = var.resource_group_name
  ttl                 = 300
  records             = [var.public_ip_address]
}
