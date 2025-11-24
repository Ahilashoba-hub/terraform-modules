module "resource_group" {
  source   = "./modules/resource_group"
  name     = "fpoc-rgp"
  location = "Central India"
}


module "network" {
  source              = "./modules/network"
  resource_group_name = module.resource_group.name
  location            = module.resource_group.location
}

module "vm" {
  source              = "./modules/vm"
  resource_group_name = module.resource_group.name
  location            = module.resource_group.location
  subnet_id           = module.network.subnet_id
  nsg_id              = module.network.nsg_id
  public_ip_id        = module.network.public_ip_id
}

module "storage" {
  source              = "./modules/storage"
  resource_group_name = module.resource_group.name
  location            = module.resource_group.location
  storage_account_name = "webapstgeactaahi10011"
  file_share_name     = "webappsharone"
  quota_gb            = 10
  user_principal_name = "storage-svc-user-new@ramyap2026outlook.onmicrosoft.com"
  display_name        = "Storage Service User New"
  mail_nickname       = "storage-svc-user-new"
  user_password       = "P@ssword1234!"
  vm_dependency       = module.vm #dependency to ensure file share waits for VM
  
}

module "vmss" {
  source              = "./modules/vmss"
  resource_group_name = module.resource_group.name
  location            = module.resource_group.location
  subnet_id           = module.network.subnet_id
  public_ip_id        = "vmss-pip"
  vm_admin_username   = "vmssadminuser"
  vm_admin_password   = "Welcome@123$"
  nsg_id              = module.network.nsg_id

  
}

module "dns" {
  source              = "./modules/dns"
  resource_group_name = module.resource_group.name
  public_ip_address   = module.vmss.public_ip_address 
}

module "aks" {
  source              = "./modules/aks"
  resource_group_name = module.resource_group.name
  location            = module.resource_group.location
  aks_cluster_name    = "myAKSCluster"
  node_count          = "1"
  vm_size             = "Standard_B2ms"
  kubernetes_version  = "1.31.7"
}