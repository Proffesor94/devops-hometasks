resource "kubernetes_deployment" "static-deployment" {
  metadata {
    name = var.deployment_name
    labels = {
      App = var.app_name
    }
  }

  spec {
    replicas = var.replicas_count
    selector {
      match_labels = {
        App = var.app_name
      }
    }

    template {
      metadata {
        labels = {
          App = var.app_name
        }
      }

      spec {
        container {
          image             = var.image_name
          name              = var.container_name
          image_pull_policy = "IfNotPresent"

          port {
            container_port = var.app_port
          }

          readiness_probe {
            http_get {
              path = "/"
              port = var.app_port
            }
            initial_delay_seconds = 10
            timeout_seconds       = 1

          }

          liveness_probe {
            http_get {
              path = "/"
              port = var.app_port
            }
            initial_delay_seconds = 10
            timeout_seconds       = 1
          }

          resources {
            limits = {
              cpu    = "0.5"
              memory = "512Mi"
            }
            requests = {
              cpu    = "250m"
              memory = "50Mi"
            }
          }
        }
      }
    }
  }
}