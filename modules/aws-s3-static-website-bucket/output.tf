output "arn" {
  description = "s3 bucket arn"
  value = aws_s3_bucket.s3_bucket.arn
}

output "name" {
  description = "s3 bucket name (id)"
  value = aws_s3_bucket.s3_bucket.id
}

output "domain" {
  description = "s3 website domain"
  value = aws_s3_bucket_website_configuration.s3_bucket.website_domain 
}