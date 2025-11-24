output "dns_zone_name" {
  value = azurerm_dns_zone.example.name
}

output "dns_a_record_fqdn" {
  value = azurerm_dns_a_record.example.fqdn
}
