# modules/worker/main.tf

variable "worker_image" {
  description = "Worker app docker image"
  type        = string
}

# 1. Deployment (v1) - Background worker ke liye
resource "kubernetes_deployment_v1" "worker" {
  metadata {
    name = "worker"
    labels = {
      app = "worker"
    }
  }
  spec {
    replicas = 1  # Production mein ise scaling ke liye badha sakte hain
    selector {
      match_labels = {
        app = "worker"
      }
    }
    template {
      metadata {
        labels = {
          app = "worker"
        }
      }
      spec {
        container {
          name  = "worker"
          image = var.worker_image
          
          # Worker usually database/redis se connect karta hai
          # Isliye resource limits hona achha rehta hai
          resources {
            requests = {
              cpu    = "100m"
              memory = "128Mi"
            }
          }
        }
      }
    }
  }
}