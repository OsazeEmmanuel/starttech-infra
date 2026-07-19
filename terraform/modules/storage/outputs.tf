output "frontend_bucket_name" {
  value = aws_s3_bucket.frontend_bucket.bucket
}

output "frontend_bucket_arn" {
  value = aws_s3_bucket.frontend_bucket.arn
}

output "frontend_bucket_regional_domain_name" {
  value = aws_s3_bucket.frontend_bucket.bucket_regional_domain_name
}

output "ecr_repository_name" {
  value = aws_ecr_repository.backend_api.name
}

output "ecr_repository_url" {
  value = aws_ecr_repository.backend_api.repository_url
}
