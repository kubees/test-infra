locals {
  namespace = "frontend"
}
resource "helm_release" "frontend_release" {
  name              = "frontend"
  chart             = "webapp-helm-chart"
  repository        = "${path.module}/webapp-helm-chart"
  namespace         = local.namespace
  create_namespace  = true
  dependency_update = true
  cleanup_on_fail   = true
  set {
    name  = "deployment.container.digest"
    value = var.frontend_image_digest
  }
  set {
    name  = "deployment.container.memoryLimit"
    value = "100Mi"
  }
  set {
    name  = "deployment.container.memoryRequest"
    value = "75Mi"
  }
  set {
    name  = "deployment.container.cpuRequest"
    value = "75m"
  }
  set {
    name  = "deployment.container.cpuLimit"
    value = "100m"
  }
  wait = var.wait
}
