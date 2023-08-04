# S3 public bucket 
output "s3_bucket_public_arn" {
  description = "The public ARN of S3 bucket"
  value       = module.s3_bucket.s3_bucket_public_arn
}

# S3 private bucket 
output "s3_bucket_private_arn" {
  description = "The private ARN of S3 bucket"
  value       = module.s3_bucket.s3_bucket_private_arn
}