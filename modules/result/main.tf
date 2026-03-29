# modules/result/main.tf
variable "result_image" { 
  type = string 
}

# 1. Deployment (v1)
resource "kubernetes_deployment_v1" "result" {
  metadata { 
    name = "result"
    labels = {
      app = "result"
    }
  }
  spec {
    replicas = 1
    selector { 
      match_labels = { app = "result" } 
    }
    template {
      metadata { 
        labels = { app = "result" } 
      }
      spec {
        container {
          name  = "result"
          image = var.result_image
          port { container_port = 80 }
        }
      }
    }
  }
}

# 2. Service (v1)
resource "kubernetes_service_v1" "result" {
  metadata { 
    name = "result-service" 
  }
  spec {
    # AKS ke liye LoadBalancer best hai, isse public IP mil jayega
    type = "LoadBalancer" 
    
    selector = { app = "result" }
    
    port {
      port        = 80
      target_port = 80
      # NodePort ki zaroorat nahi hai LoadBalancer mein, Azure khud manage karega
    }
  }
}
