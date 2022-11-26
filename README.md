<!-- BEGIN_TF_DOCS -->

---
## Usage
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | ~> 1.3.0 |
## Providers

No providers.
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_frontend_image_digest"></a> [frontend\_image\_digest](#input\_frontend\_image\_digest) | This is the Docker image digest of the frontend application | `string` | n/a | yes |
| <a name="input_playlist_microservice_image_digest"></a> [playlist\_microservice\_image\_digest](#input\_playlist\_microservice\_image\_digest) | This is the Docker image digest of the playlist microservice | `string` | n/a | yes |
| <a name="input_videos_microservice_image_digest"></a> [videos\_microservice\_image\_digest](#input\_videos\_microservice\_image\_digest) | This is the Docker image digest of the videos microservice | `string` | n/a | yes |
## Outputs

No outputs.
<!-- END_TF_DOCS -->
