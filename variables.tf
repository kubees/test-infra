variable "frontend_image_digest" {
  type = string
  #   default = "65c98e9a5bd03be73b9ba2ce77a6eab195379a5339e2ced63339ff0198b4ef1b"
  description = "This is the Docker image digest of the frontend application"
}

variable "videos_microservice_image_digest" {
  type = string
  #   default = "9b5a88690b8834ced11faa46dcb551e2d83b0cca39691bd14418115e14ea12bc"
  description = "This is the Docker image digest of the videos microservice"
}

variable "playlist_microservice_image_digest" {
  type = string
  #   default = "9fc8eb93934164163584b41c019738da9fcefaf09223e1494679d00869759ea2"
  description = "This is the Docker image digest of the playlist microservice"
}

variable "wait" {
  type        = true
  description = "Wait for realses to be successful or not."
}
