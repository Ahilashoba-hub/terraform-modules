variable "resource_group_name" {
  type = string
}

variable "location" {
  type = string
}

variable "storage_account_name" {
  type = string
}

variable "file_share_name" {
  type = string
}

variable "quota_gb" {
  type = number
  default = 10
}

variable "user_principal_name" {
  type = string
}

variable "display_name" {
  type = string
}

variable "mail_nickname" {
  type = string
}

variable "user_password" {
  type = string
}

variable "vm_dependency" {
  description = "Optional dependency to ensure file share waits for VM"
  type        = any
  default     = null
}
