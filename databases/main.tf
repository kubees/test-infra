locals {
  namespace = "databases"
}
resource "helm_release" "redis_release" {
  name              = "redis"
  chart             = "redis-helm-chart"
  repository        = "${path.module}/redis-helm-chart"
  namespace         = local.namespace
  create_namespace  = true
  dependency_update = true
  depends_on = [
    kubernetes_secret.redis_secret
  ]
}

resource "kubernetes_namespace" "databases" {
  metadata {
    annotations = {
      name = local.namespace
    }
    name = local.namespace
  }
}

resource "kubernetes_secret" "redis_secret" {
  metadata {
    name      = "redis-secret"
    namespace = local.namespace
  }

  # Since it's a test infrastructure it is okay to use plaintext
  data = {
    password = var.db_password
  }

  type = "kubernetes.io/opaque"
  depends_on = [
    kubernetes_namespace.databases
  ]
}
