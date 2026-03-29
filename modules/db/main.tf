# modules/db/main.tf

variable "db_image" {
  type = string
}

# 1. Deployment (V1) - Ye Pods create karega
resource "kubernetes_deployment_v1" "db" {
  metadata {
    name = "db"
    labels = {
      app = "db"
    }
  }

  spec {
    replicas = 1
    selector {
      match_labels = {
        app = "db"
      }
    }

    template {
      metadata {
        labels = {
          app = "db"
        }
      }

      spec {
        container {
          name  = "db"
          image = var.db_image
          
          env {
            name  = "POSTGRES_USER"
            value = "postgres"
          }
          env {
            name  = "POSTGRES_PASSWORD"
            value = "password"
          }
          env {
            name  = "POSTGRES_DB"
            value = "postgres"
          }

          port {
            container_port = 5432
          }
        }
      }
    }
  }
}

# 2. Service (V1) - Ye network access dega (Iska syntax alag hai)
resource "kubernetes_service_v1" "db" {
  metadata {
    name = "db" # Iska name 'db' hona zaroori hai taaki worker connect kar sake
  }

  spec {
    selector = {
      app = "db"
    }

    port {
      port        = 5432
      target_port = 5432
    }

    type = "ClusterIP" # Internal communication ke liye
  }
}