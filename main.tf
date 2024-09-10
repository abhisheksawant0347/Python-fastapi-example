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


}


module "cluster" {
  source = "./cluster"

  region       = var.region
  cluster_name = var.cluster_name
  #k8s_version  = var.k8s_version
}
