output "vpc_id" {
  value = module.networking.vpc_id
}

output "public_subnet_ids" {
  value = module.networking.public_subnet_ids
}

output "private_subnet_ids" {
  value = module.networking.private_subnet_ids
}

output "cluster_name" {
  value = module.eks.cluster_name
}

output "cluster_endpoint" {
  value = module.eks.cluster_endpoint
}

output "cluster_security_group_id" {
  value = module.eks.cluster_security_group_id
}

output "node_role_arn" {
  value = module.eks.node_role_arn
}

output "frontend_bucket_name" {
  value = module.storage.frontend_bucket_name
}

output "frontend_bucket_arn" {
  value = module.storage.frontend_bucket_arn
}

output "ecr_repository_name" {
  value = module.storage.ecr_repository_name
}

output "ecr_repository_url" {
  value = module.storage.ecr_repository_url
}

output "redis_endpoint" {
  value = module.database.redis_endpoint
}

output "redis_port" {
  value = module.database.redis_port
}
