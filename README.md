
<!-- markdownlint-disable -->
# AWS S3 bucket Terraform module [![Latest Release](https://img.shields.io/github/v/release/oysptn/terraform-aws-s3.svg)](https://github.com/oysptn/terraform-aws-s3/releases/latest)
<!-- markdownlint-restore -->

This project is part the boilderplate project for all of my terraform modules, which are all licensed under the [APACHE2](LICENSE).

## Introduction

These features of S3 bucket configurations are supported:

- server-side encryption
- object locking

## Usage

### Private bucket with versioning enabled

```hcl
module "s3_bucket" {
  source = "../s3"
    
  region = "us-east-1
  region_code = "ue1"
  project = "example project"
  environment = "dev"

  create_private_bucket = true
  force_destroy = true  
  
  tags = local.tags
}
```
### Public bucket with versioning enabled

```hcl
module "s3_bucket" {
  source = "../s3"
    
  region = "us-east-1
  region_code = "ue1"
  project = "example project"
  environment = "dev"

  create_private_bucket = false
  force_destroy = true  
  
  tags = local.tags
}
```
## Authors

Module is maintained by [Toan Trinh](https://github.com/comicalwriter) with help from [these awesome contributors](https://github.com/oysptn/terraform-aws-s3/graphs/contributors).

## License

Apache 2 Licensed. See [LICENSE](https://github.com/oysptn/terraform-aws-s3/blob/main/LICENSE) for full details.
<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 3.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | >= 3.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_kms_key.s3_bucket_encrypt_key](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/kms_key) | resource |
| [aws_s3_bucket.private](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket) | resource |
| [aws_s3_bucket.public](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket) | resource |
| [aws_s3_bucket_policy.public_read_access](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_policy) | resource |
| [aws_s3_bucket_public_access_block.block](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_public_access_block) | resource |
| [aws_s3_bucket_server_side_encryption_configuration.private](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_server_side_encryption_configuration) | resource |
| [aws_s3_bucket_server_side_encryption_configuration.public](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_server_side_encryption_configuration) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_create_private_bucket"></a> [create\_private\_bucket](#input\_create\_private\_bucket) | Create private bucket | `bool` | `false` | no |
| <a name="input_environment"></a> [environment](#input\_environment) | n/a | `string` | n/a | yes |
| <a name="input_force_destroy"></a> [force\_destroy](#input\_force\_destroy) | True or False | `bool` | `false` | no |
| <a name="input_prefix"></a> [prefix](#input\_prefix) | n/a | `string` | `"ptn"` | no |
| <a name="input_project"></a> [project](#input\_project) | n/a | `string` | n/a | yes |
| <a name="input_region"></a> [region](#input\_region) | n/a | `string` | n/a | yes |
| <a name="input_region_code"></a> [region\_code](#input\_region\_code) | n/a | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | (Optional) A mapping of tags to assign to the bucket. | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_s3_bucket_private_arn"></a> [s3\_bucket\_private\_arn](#output\_s3\_bucket\_private\_arn) | The ARN of the bucket. Will be of format arn:aws:s3:::bucketname. |
| <a name="output_s3_bucket_public_arn"></a> [s3\_bucket\_public\_arn](#output\_s3\_bucket\_public\_arn) | The ARN of the bucket. Will be of format arn:aws:s3:::bucketname. |
<!-- END_TF_DOCS -->
