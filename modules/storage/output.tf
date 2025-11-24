output "storage_account_id" {
  value = azurerm_storage_account.sa.id
}

output "file_share_name" {
  value = azurerm_storage_share.fileshare.name
}

output "storage_user_id" {
  value = azuread_user.storage_svc_user.object_id
}
output "storage_account_name" {
  value = azurerm_storage_account.sa.name
}
