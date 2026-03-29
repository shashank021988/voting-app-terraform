# modules/redis/main.tf

variable "redis_image" {
  description = "Redis docker image"
  type        = string
}

# 1. Deployment (v1)
resource "kubernetes_deployment_v1" "redis" {
  metadata {
    name = "redis"
    labels = {
      app = "redis"
    }
  }

  spec {
    replicas = 1
    selector {
      match_labels = {
        app = "redis"
      }
    }

    template {
      metadata {
        labels = {
          app = "redis"
        }
      }

      spec {
        container {
          name  = "redis"
          image = var.redis_image
          
          port {
            container_port = 6379
          }

          # Production-grade tip: Resources limits add karna achhi practice hai
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

# 2. Service (v1)
resource "kubernetes_service_v1" "redis" {
  metadata {
    name = "redis"
  }

  spec {
    selector = {
      app = "redis"
    }

    port {
      port        = 6379
      target_port = 6379
    }

    type = "ClusterIP"
  }
}