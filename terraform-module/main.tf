
module "aks_rg" {
  source      = "./modules/resource-group"
  rg_name     = "aks_rg"
  location    = "eastus"
  environment = "prod"

}
/*
module "loganalytics" {
  source                       = "./modules/log-analytics"
  location                     = var.location
  environment                  = var.environment
  rg_name = module.aks_rg.rg_name
  depends_on = [ module.aks_rg ]

}*/
module "vnet_aks" {
  source       = "./modules/virtual-network"
  location     = var.location
  environment  = var.environment
  cluster_name = var.cluster_name
  rg_name      = module.aks_rg.rg_name
  depends_on   = [module.aks_rg]
}
/*
module "aks" {
  source                     = "./modules/aks"
  location                   = var.location
  environment                = var.environment
  cluster_name = var.cluster_name
  rg_name = module.aks_rg.rg_name
  ssh_public_key = var.ssh_public_key
  username = var.username
  registry_scope = module.acr.registry_scope
  node_count = 1
  node_vm_size = "Standard_D2_v2"
  aks_subnet_id = module.vnet_aks.aks_subnet_id
  log_analytics_id = module.loganalytics.log_analytics_id
  rg_name_prefix = var.rg_name_prefix
  depends_on = [ module.aks_rg, module.vnet_aks, module.loganalytics, module.acr ]

}

module "acr" {
  source      = "./modules/acr"
  location    = var.location
  environment = var.environment
  rg_name = module.aks_rg.rg_name
  depends_on = [ module.aks_rg ]
}

module "keyvault" {
  source           = "./modules/keyvault"
  rg_name = module.aks_rg.rg_name
  location = var.location
  environment = var.environment

  depends_on = [
    module.aks,
    module.acr
  ]
}*/
module "vm" {
  source      = "./modules/vm"
  rg_name     = module.aks_rg.rg_name
  location    = var.location
  environment = var.environment
  vmusername  = var.vmusername
  vm_subnet   = module.vnet_aks.vm_subnet_id
  depends_on  = [module.vnet_aks]
}