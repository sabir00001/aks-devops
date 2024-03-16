variable "rg_name" {
    type = string
}
variable "location" {
    type = string
}
variable "environment" {
    type = string
  
}
variable "app_service_names" {
  type    = list(string)
  default = ["sabir-east-us-app-01", "sabir-east-us-app-02", "sabir-east-us-app-03"]
}