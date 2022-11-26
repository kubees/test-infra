locals {
  namespace = "frontend"
}
resource "helm_release" "videos_microservice_release" {
  name              = "frontend"
  chart             = "webapp-helm-chart"
  repository        = "${path.module}/webapp-helm-chart"
  namespace         = local.namespace
  create_namespace  = true
  dependency_update = true
  cleanup_on_fail   = true
}
