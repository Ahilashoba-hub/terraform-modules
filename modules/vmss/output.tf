output "vmss_name" {
  value = azurerm_linux_virtual_machine_scale_set.example.name
}
output "public_ip_address" {
  value = azurerm_public_ip.example.ip_address
  
}
