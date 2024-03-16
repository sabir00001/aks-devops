variable "rg_name" {
  type = string 
}
variable "location" {
  type = string
}
variable "environment" {
  type = string
}
variable "cluster_name" {
  type = string
  
}
variable "username" {
  type = string
  
}
variable "ssh_public_key" {
  type = string
  
}
variable "registry_scope" {
  type = string
  
}
variable "rg_name_prefix" {
  type = string
  
}
variable "node_count" {
  type = number
}
variable "aks_subnet_id" {
  type = string
  
}
variable "log_analytics_id" {
  type = string
  
}
variable "node_vm_size" {
  type = string
}