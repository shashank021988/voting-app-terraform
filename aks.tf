# 1. Resource Group Define karna (Jo missing tha)
resource "azurerm_resource_group" "rg" {
  name     = "shashank-aks-rg"
  location = "southindia"
}

# 2. AKS Cluster Configuration
resource "azurerm_kubernetes_cluster" "aks" {
  name                = "shashank-aks-cluster"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  dns_prefix          = "votingapp"

  default_node_pool {
    name       = "default"
    node_count = 1
    vm_size    = "Standard_B2s_v2" # Free tier friendly
  }

  identity {
    type = "SystemAssigned"
  }
}

# Outputs (Taaki connectivity check kar sakein)
output "kubernetes_cluster_name" {
  value = azurerm_kubernetes_cluster.aks.name
}

output "resource_group_name" {
  value = azurerm_resource_group.rg.name
}