variable "frontend_bucket_name" {
  description = "Frontend S3 bucket"
  type        = string
}

variable "ecr_repository_name" {
  description = "Backend ECR repository"
  type        = string
}
