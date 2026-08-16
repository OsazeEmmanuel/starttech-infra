variable "aws_region" {
  description = "AWS Region"
  type        = string
  default     = "eu-west-1"
}

variable "environment" {
  description = "Deployment environment"
  type        = string
  default     = "production"
}

variable "vpc_cidr" {
  description = "VPC CIDR"
  type        = string
  default     = "10.0.0.0/16"
}

variable "availability_zones" {
  type = list(string)

  default = [
    "eu-west-1a",
    "eu-west-1b"
  ]
}

variable "public_subnet_cidrs" {
  type = list(string)

  default = [
    "10.0.1.0/24",
    "10.0.2.0/24"
  ]
}

variable "private_subnet_cidrs" {
  type = list(string)

  default = [
    "10.0.11.0/24",
    "10.0.12.0/24"
  ]
}

variable "cluster_name" {
  description = "StartTech EKS Cluster Name"
  type        = string
  default     = "starttech-cluster"
}

variable "cluster_version" {
  description = "Kubernetes Version"
  type        = string
  default     = "1.34"
}

variable "frontend_bucket_name" {
  description = "Frontend S3 bucket"
  type        = string
  default     = "starttech-frontend-bucket-osaze"
}

variable "ecr_repository_name" {
  description = "Backend ECR repository"
  type        = string
  default     = "starttech-backend-api"
}

variable "tags" {
  description = "Common tags applied to all resources"

  type = map(string)

  default = {
    Project     = "starttech"
    Environment = "production"
    ManagedBy   = "Terraform"
  }
}
