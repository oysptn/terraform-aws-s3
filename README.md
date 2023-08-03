
<!-- markdownlint-disable -->
# AWS S3 bucket Terraform module [![Latest Release](https://img.shields.io/github/v/release/oysptn/terraform-aws-s3.svg)](https://github.com/oysptn/terraform-aws-s3/releases/latest)
<!-- markdownlint-restore -->

This project is part the boilderplate project for all of my terraform modules, which are all licensed under the [APACHE2](LICENSE).

## Introduction

These features of S3 bucket configurations are supported:

- static web-site hosting
- access logging
- versioning
- CORS
- lifecycle rules
- server-side encryption
- object locking
- Cross-Region Replication (CRR)
- ELB log delivery bucket policy
- ALB/NLB log delivery bucket policy

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
## Examples:
- [S3 Bucket Object]() - Manage S3 bucket objects.

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.13.1 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 4.9 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | >= 5.0.0 |

## Authors

Module is maintained by [Toan Trinh](https://github.com/comicalwriter) with help from [these awesome contributors](https://github.com/oysptn/terraform-aws-s3/graphs/contributors).

## License

Apache 2 Licensed. See [LICENSE](https://github.com/oysptn/terraform-aws-s3/blob/main/LICENSE) for full details.