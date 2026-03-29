terraform {
  required_version = ">= 1.0.0"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 3.0.0"
    }
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = ">= 2.10.0" 
    }
  }

  # REMOTE BACKEND: Ye state file ko Azure Storage mein save karega
  backend "azurerm" {
    resource_group_name  = "tfstate-rg"            # Confirm karo ye RG Azure par hai
    storage_account_name = "tfstate01shashank"       # Confirm karo ye Storage Account Azure par hai
    container_name       = "tfstate"               # Confirm karo ye Container bana hua hai
    key                  = "voting-app.tfstate"
    # Note: ARM_ACCESS_KEY pipeline se automatically utha lega
  }
}

provider "azurerm" {
  features {}
}

# KUBERNETES PROVIDER: Direct AKS Connection
# "azurerm_kubernetes_cluster.aks" ka naam tumhare aks.tf file se match hona chahiye
provider "kubernetes" {
  host                   = azurerm_kubernetes_cluster.aks.kube_config.0.host
  client_certificate     = base64decode(azurerm_kubernetes_cluster.aks.kube_config.0.client_certificate)
  client_key             = base64decode(azurerm_kubernetes_cluster.aks.kube_config.0.client_key)
  cluster_ca_certificate = base64decode(azurerm_kubernetes_cluster.aks.kube_config.0.cluster_ca_certificate)
}