locals {
  namespace = "microservices"
}
resource "helm_release" "videos_microservice_release" {
  name              = "videos"
  chart             = "videos-helm-chart"
  repository        = "${path.module}/videos-helm-chart"
  namespace         = local.namespace
  create_namespace  = true
  dependency_update = true
  cleanup_on_fail   = true

  set {
    name  = "microservices-umbrella-chart.deployment.container.digest"
    value = var.videos_microservice_image_digest
  }
  set {
    name  = "microservices-umbrella-chart.monitoring.enabled"
    value = false
  }
}

resource "kubernetes_secret" "videos_redis_secret" {
  metadata {
    name      = "videos-redis-secret"
    namespace = local.namespace
  }

  # Since it's a test infrastructure it is okay to use plaintext
  data = {
    PASSWORD = var.db_password
  }

  type = "kubernetes.io/opaque"
  depends_on = [
    kubernetes_namespace.microservices
  ]
}

resource "helm_release" "playlist_microservice_release" {
  name              = "playlist"
  chart             = "playlist-helm-chart"
  repository        = "${path.module}/playlist-helm-chart"
  namespace         = local.namespace
  create_namespace  = true
  dependency_update = true
  cleanup_on_fail   = true

  set {
    name  = "microservices-umbrella-chart.deployment.container.digest"
    value = var.playlist_microservice_image_digest
  }
  set {
    name  = "microservices-umbrella-chart.monitoring.enabled"
    value = false
  }
}

resource "kubernetes_secret" "playlist_redis_secret" {
  metadata {
    name      = "redis-secret"
    namespace = local.namespace
  }

  # Since it's a test infrastructure it is okay to use plaintext
  data = {
    PASSWORD = var.db_password
  }

  type = "kubernetes.io/opaque"

  depends_on = [
    kubernetes_namespace.microservices
  ]
}

resource "kubernetes_namespace" "microservices" {
  metadata {
    annotations = {
      name = local.namespace
    }
    name = local.namespace
  }
}
