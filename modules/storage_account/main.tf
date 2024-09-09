resource "azurerm_storage_account" "storage_account" {
  name                = "demonsc1234"
  resource_group_name = var.resource_group_name

  location                 = var.region
  account_tier             = "Standard"
  account_replication_type = "LRS"

  #network_rules {
  #  default_action             = "Deny"
  #  ip_rules                   = ["100.0.0.1"]
  # virtual_network_subnet_ids = ["var.subnet_id"]
  #}
}