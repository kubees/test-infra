provider "helm" {
  kubernetes {
    config_path = "~/.kube/config"
  }
}

provider "kubernetes" {
  config_path = "~/.kube/config"
}

terraform {
  required_version = "~> 1.3.0"
  required_providers {
    helm       = {}
    kubernetes = {}
  }
}
