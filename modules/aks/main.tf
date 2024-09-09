# azurerm_kubernetes_cluster to create k8s cluster
# official documentation https://registry.terraform.io/providers/hashicorp/azurerm/3.65.0/docs/resources/kubernetes_cluster
resource "azurerm_kubernetes_cluster" "k8s" {
  name                = var.cluster_name
  location            = var.region
  resource_group_name = var.resource_group_name
  dns_prefix          = var.dns_prefix
  #kubernetes_version  = var.k8s_version
  node_resource_group = "aks${var.cluster_name}"
  tags                = var.aks_tags

  default_node_pool {
    name                         = "agentpool"
    type                         = "VirtualMachineScaleSets"
    node_count                   = 1
    vm_size                      = "Standard_E8-2ds_v4"
    zones                        = [1, 2, 3]
    vnet_subnet_id               = var.az_subnet_id
    only_critical_addons_enabled = true

    #node_labels = {
    #  "worker-name" = "system"
    #}
  }

  identity {
    type = "SystemAssigned"
  }

  network_profile {
    #network_plugin = var.network_plugin
    network_plugin    = "kubenet"
    load_balancer_sku = "standard"
  }

  #oidc_issuer_enabled       = true
  # enable workload identity
  #workload_identity_enabled = true
}
