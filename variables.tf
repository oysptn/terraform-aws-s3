output "s3_bucket_public_arn" {
  description = "The ARN of the bucket. Will be of format arn:aws:s3:::bucketname."
  value = try(aws_s3_bucket.public[0].arn, "")
}

output "s3_bucket_private_arn" {
  description = "The ARN of the bucket. Will be of format arn:aws:s3:::bucketname."
  value = try(aws_s3_bucket.private[0].arn, "")
}

                  

