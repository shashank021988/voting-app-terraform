# modules/vote/main.tf

variable "vote_image" { 
  type = string 
}

variable "vote_replicas" { 
  type    = number
  default = 2 
}

# 1. Deployment (v1)
resource "kubernetes_deployment_v1" "vote" {
  metadata { 
    name = "vote"
    labels = {
      app = "vote"
    }
  }
  spec {
    replicas = var.vote_replicas
    selector { 
      match_labels = { app = "vote" } 
    }
    template {
      metadata { 
        labels = { app = "vote" } 
      }
      spec {
        container {
          name  = "vote"
          image = var.vote_image
          port { container_port = 80 }
          
          # Optional: Health checks (Senior DevOps practice)
          liveness_probe {
            http_get {
              path = "/"
              port = 80
            }
            initial_delay_seconds = 3
            period_seconds        = 3
          }
        }
      }
    }
  }
}

# 2. Service (v1)
resource "kubernetes_service_v1" "vote" {
  metadata { 
    name = "voting-service" 
  }
  spec {
    # AKS ke liye LoadBalancer zaroori hai public access ke liye
    type = "LoadBalancer" 
    
    selector = { app = "vote" }
    
    port {
      port        = 80
      target_port = 80
    }
  }
}

