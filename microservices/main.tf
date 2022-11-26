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
    value = "sha256:${var.videos_microservice_image_digest}"
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
    value = "sha256:${var.playlist_microservice_image_digest}"
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
}
