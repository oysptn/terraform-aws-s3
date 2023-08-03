locals {
  prefix = var.prefix
  project = var.project
  environment = var.environment
  region_code = var.region_code
  create_private_bucket = var.create_private_bucket
}

resource "aws_kms_key" "s3_bucket_encrypt_key" {
  description = "This key is used to encrypt bucket objects"
  deletion_window_in_days = 10
}

# Public bucket
resource "aws_s3_bucket" "public" {
  count = local.create_private_bucket ? 0 : 1

  bucket = "${local.prefix}-${local.project}-${local.environment}-s3-bucket-${local.region_code}-public"
  force_destroy = var.force_destroy

  tags = merge(var.tags, {
    ApplicationRole = "AWS S3 Public Bucket"
    SensitiveData   = "true"
    Environment = local.environment
  })
}

# Encryption for s3 bucket public
resource "aws_s3_bucket_server_side_encryption_configuration" "public" {
  count = local.create_private_bucket ? 0 : 1

  bucket = aws_s3_bucket.public[count.index].id

  rule {
    apply_server_side_encryption_by_default {
      kms_master_key_id = aws_kms_key.s3_bucket_encrypt_key.arn
      sse_algorithm = "aws:kms"
    }
  }
}

# Bucket public access block
resource "aws_s3_bucket_public_access_block" "block" {
  count = local.create_private_bucket ? 0 : 1

  bucket = aws_s3_bucket.public[count.index].id

  block_public_acls = false 
  block_public_policy = false
  ignore_public_acls = false
  restrict_public_buckets = false
}

# Bucket policy for public access
resource "aws_s3_bucket_policy" "public_read_access" {
  count = local.create_private_bucket ? 0 : 1

  bucket = aws_s3_bucket.public[count.index].id  
  policy = jsonencode({
    "Version": "2012-10-17",
    "Statement": [
      {
        "Effect": "Allow",
        "Principal": "*",
        "Action": [ "s3:GetObject", "s3:ListBucket" ],
        "Resource": [
          "${aws_s3_bucket.public[count.index].arn}",
          "${aws_s3_bucket.public[count.index].arn}/*"
        ]
      }
    ]
  })
}

# Private bucket
resource "aws_s3_bucket" "private" {
  count = local.create_private_bucket ? 1 : 0

  bucket = "${local.prefix}-${local.project}-${local.environment}-s3-bucket-${local.region_code}-private"
  force_destroy = var.force_destroy

  tags = merge(var.tags, {
    ApplicationRole = "AWS S3 private Bucket"
    SensitiveData   = "true"
    Environment = local.environment
  })
}

# Encryption for s3 bucket private
resource "aws_s3_bucket_server_side_encryption_configuration" "private" {
  count = local.create_private_bucket ? 1 : 0

  bucket = aws_s3_bucket.private[count.index].id

  rule {
    apply_server_side_encryption_by_default {
      kms_master_key_id = aws_kms_key.s3_bucket_encrypt_key.arn
      sse_algorithm = "aws:kms"
    }
  }
}



