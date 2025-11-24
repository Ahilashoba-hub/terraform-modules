resource "azurerm_storage_account" "sa" {
  name                     = var.storage_account_name
  resource_group_name      = var.resource_group_name
  location                 = var.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_storage_share" "fileshare" {
  name                 = var.file_share_name
  storage_account_name = azurerm_storage_account.sa.name
  quota                = var.quota_gb
  depends_on           = [var.vm_dependency]
}

resource "azuread_user" "storage_svc_user" {
  user_principal_name   = var.user_principal_name
  display_name          = var.display_name
  mail_nickname         = var.mail_nickname
  password              = var.user_password
  force_password_change = false
}

resource "azurerm_role_assignment" "storage_svc_role" {
  scope                = azurerm_storage_account.sa.id
  role_definition_name = "Storage File Data SMB Share Contributor"
  principal_id         = azuread_user.storage_svc_user.object_id
}
