# S3 module example
<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 5.0.0 |

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_s3_bucket"></a> [s3\_bucket](#module\_s3\_bucket) | oysptn/s3/aws | n/a |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_create_private_bucket"></a> [create\_private\_bucket](#input\_create\_private\_bucket) | s3 | `bool` | `true` | no |
| <a name="input_environment"></a> [environment](#input\_environment) | n/a | `string` | n/a | yes |
| <a name="input_force_destroy"></a> [force\_destroy](#input\_force\_destroy) | n/a | `bool` | `false` | no |
| <a name="input_project"></a> [project](#input\_project) | n/a | `string` | n/a | yes |
| <a name="input_region"></a> [region](#input\_region) | n/a | `string` | n/a | yes |
| <a name="input_region_code"></a> [region\_code](#input\_region\_code) | n/a | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_s3_bucket_private_arn"></a> [s3\_bucket\_private\_arn](#output\_s3\_bucket\_private\_arn) | The private ARN of S3 bucket |
| <a name="output_s3_bucket_public_arn"></a> [s3\_bucket\_public\_arn](#output\_s3\_bucket\_public\_arn) | The public ARN of S3 bucket |
<!-- END_TF_DOCS -->