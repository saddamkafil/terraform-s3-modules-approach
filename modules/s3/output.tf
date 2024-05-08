output "aws_s3_bucket_website_configuration" {
  description = "The static URL of the bucket"
  value       = aws_s3_bucket.bucket.website_endpoint
}
