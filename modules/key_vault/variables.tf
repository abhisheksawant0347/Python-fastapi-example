variable "region" {
  type        = string
  description = "azure region where the aks cluster must be created, this region should match where you have created the resource group, vnet and subnet"
}

variable "resource_group_name" {
  type        = string
  description = "azure resource group name where the aks cluster should be created"
}

variable "vault_name" {
  type        = string
  description = "Key Vault name in Azure"
  default = "testhjdh07"
}

variable "key_name" {
  type        = string
  description = "The name of the key to be created. The value will be randomly generated if blank."
  default     = ""
}

variable "sku_name" {
  type        = string
  description = "The SKU of the vault to be created."
  default     = "standard"
  validation {
    condition     = contains(["standard", "premium"], var.sku_name)
    error_message = "The sku_name must be one of the following: standard, premium."
  }
}

variable "secret_name" {
  type        = string
  description = "Key Vault Secret name in Azure"
  default = "DBpass"
}

variable "secret_value" {
  type        = string
  description = "Key Vault Secret value in Azure"
  default = "@Aa123456789!"
  sensitive   = true
}

variable "key_type" {
  description = "The JsonWebKeyType of the key to be created."
  default     = "RSA"
  type        = string
  validation {
    condition     = contains(["EC", "EC-HSM", "RSA", "RSA-HSM"], var.key_type)
    error_message = "The key_type must be one of the following: EC, EC-HSM, RSA, RSA-HSM."
  }
}

variable "key_ops" {
  type        = list(string)
  description = "The permitted JSON web key operations of the key to be created."
  default     = ["decrypt", "encrypt", "sign", "unwrapKey", "verify", "wrapKey"]
}

variable "key_size" {
  type        = number
  description = "The size in bits of the key to be created."
  default     = 2048
}

variable "msi_id" {
  type        = string
  description = "The Managed Service Identity ID. If this value isn't null (the default), 'data.azurerm_client_config.current.object_id' will be set to this value."
  default     = null
}
