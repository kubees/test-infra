locals {
  db_password = "redis"
}
module "redis" {
  source      = "./databases"
  db_password = local.db_password
}

module "microservices" {
  source                             = "./microservices"
  db_password                        = local.db_password
  videos_microservice_image_digest   = var.videos_microservice_image_digest
  playlist_microservice_image_digest = var.playlist_microservice_image_digest
  depends_on = [
    module.redis
  ]
}

module "frontend" {
  source                = "./frontend"
  frontend_image_digest = var.frontend_image_digest
  depends_on = [
    module.microservices
  ]
}
