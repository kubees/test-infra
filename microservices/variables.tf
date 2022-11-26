variable "db_password" {
  type        = string
  description = "This is the redis database password."
}

variable "videos_microservice_image_digest" {
  type = string
}

variable "playlist_microservice_image_digest" {
  type = string
}
