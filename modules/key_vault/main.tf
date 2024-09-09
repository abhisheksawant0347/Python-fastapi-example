data "azurerm_client_config" "current" {}

resource "azurerm_key_vault" "vault" {
  name                       = var.vault_name
  location                   = var.region
  resource_group_name        = var.resource_group_name
  tenant_id                  = data.azurerm_client_config.current.tenant_id
  sku_name                   = var.sku_name
  #soft_delete_enabled         = true
  soft_delete_retention_days  = 7
  purge_protection_enabled    = false

  access_policy {
    tenant_id = data.azurerm_client_config.current.tenant_id
    object_id = data.azurerm_client_config.current.object_id
    key_permissions = [
      "Get",
      "List",
      "Delete"
    ]

    secret_permissions = [
      "Get",
      "List",
      "Set",
      "Delete",
      "Purge"
    ]

    storage_permissions = [
      "Get",
      "Delete"
    ]
  }
  }

resource "azurerm_key_vault_secret" "username"{
  name         = var.secret_name
  value        = var.secret_value
  key_vault_id = azurerm_key_vault.vault.id
}

#resource "random_string" "azurerm_key_vault_key_name" {
#  length  = 13
#  lower   = true
#  numeric = false
#  special = false
#  upper   = false
#}

#resource "azurerm_key_vault_key" "key" {
#  name = coalesce(var.key_name, "key-${random_string.azurerm_key_vault_key_name.result}")

#  key_vault_id = azurerm_key_vault.vault.id
#  key_type     = var.key_type
#  key_size     = var.key_size
#  key_opts     = var.key_ops

#  rotation_policy {
#    automatic {
#      time_before_expiry = "P30D"
#    }

#    expire_after         = "P90D"
#    notify_before_expiry = "P29D"
#  }
#}
