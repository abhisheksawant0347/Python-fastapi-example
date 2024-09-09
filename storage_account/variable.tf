variable "storage_account_Name" {
    type=string
    default =""
}
variable "resource_group_name" {
    type= string
    default =""
}
variable "location" {
     type=string
     default =""
 }
variable "region" {
  type        = string
  description = "azure region where the aks cluster must be created, this region should match where you have created the resource group, vnet and subnet"
}
variable "vnet" {
  type        = string
  description = "The name of the virtual network. Changing this forces a new resource to be created."
}
variable "subnet_id" {
  type        = string
  description = "The name of the subnet. Changing this forces a new resource to be created."
}
variable "account_tier" {
  type=string
  default =""
}
variable "account_replication_type" {
  type =string
  default =""
}
variable "tagging" {
  type = map
  default = {
  }
}