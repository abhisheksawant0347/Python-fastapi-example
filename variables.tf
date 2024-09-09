variable "region" {
  type        = string
  description = "aks region where the resources are being created"
  default     = "westus3"
}

variable "cluster_name" {
  type        = string
  description = "aks cluster name, same name is used for resource group, vnet and subnets"
  default     = "azureterraform"
}

#variable "k8s_version" {
#  type        = string
#description = "k8s version"
#  default     = ""
#}
