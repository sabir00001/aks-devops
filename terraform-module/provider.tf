terraform {
  required_version = ">=1.0"

  required_providers {
    azapi = {
      source  = "azure/azapi"
      version = "~>1.5"
    }
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>3.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "~>3.0"
    }
    time = {
      source  = "hashicorp/time"
      version = "0.9.1"
    }
    #  # Terraform State Storage to Azure Storage Container
    #   backend "azurerm" {
    #     resource_group_name   = "terraform-storage-rg"
    #     storage_account_name  = "terraformstatekalyan"
    #     container_name        = "tfstatefiles"
    #     key                   = "terraform-custom-vnet.tfstate" 
    #     }               
  }
}
provider "azurerm" {
  features {}


}