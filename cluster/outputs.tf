
output "az_rg_id" {
  description = "The ID of the resource group"
  value       = module.vnet_with_subnets.az_rg_id
}

output "az_rg_name" {
  description = "The name of the resource group"
  value       = module.vnet_with_subnets.az_rg_name
}

output "az_vnet_id" {
  description = "The ID of the vnet"
  value       = module.vnet_with_subnets.az_vnet_id
}

output "az_subnet_id" {
  description = "The ID of the subnet"
  value       = module.vnet_with_subnets.az_subnet_id
}
