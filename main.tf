locals {
  db_password = "redis"
}
module "redis" {
  source      = "./databases"
  db_password = local.db_password
}

module "microservices" {
  source      = "./microservices"
  db_password = local.db_password
  depends_on = [
    module.redis
  ]
}

