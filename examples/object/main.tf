locals {
  tags = {
    Project = var.project
    Environment = var.environment
  }
}

module "s3_bucket" {
  source = "oysptn/s3/aws"  
  
  region = var.region
  region_code = var.region_code
  project = local.tags.Project
  environment = local.tags.Environment

  create_private_bucket = var.create_private_bucket
  force_destroy = var.force_destroy  
  
  tags = local.tags
}