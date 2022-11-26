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
}

resource "kubernetes_secret" "example" {
  metadata {
    name = "redis-secret"
    namespace = local.namespace
  }

  # Since it's a test infrastructure it is okay to use plaintext
  data = {
    password = "redis"
  }

  type = "kubernetes.io/opaque"
}