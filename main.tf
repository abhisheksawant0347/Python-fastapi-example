terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "3.93.0"
    }
  }
}
provider "azurerm" {
  features {}

  client_id       = var.client_id
  client_secret   = var.client_secret
  subscription_id = var.subscription_id
  tenant_id       = var.tenant_id
}


module "cluster" {
  source = "./cluster"

  region       = var.region
  cluster_name = var.cluster_name
  #k8s_version  = var.k8s_version
}
