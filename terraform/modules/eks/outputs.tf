output "cluster_name" {
  description = "EKS Cluster Name"
  value       = aws_eks_cluster.starttech_cluster.name
}

output "cluster_endpoint" {
  description = "EKS API Endpoint"
  value       = aws_eks_cluster.starttech_cluster.endpoint
}

output "cluster_certificate_authority" {
  description = "Cluster Certificate Authority"
  value       = aws_eks_cluster.starttech_cluster.certificate_authority[0].data
}

output "cluster_security_group_id" {
  description = "Cluster Security Group"
  value       = aws_eks_cluster.starttech_cluster.vpc_config[0].cluster_security_group_id
}

output "node_role_arn" {
  description = "IAM Role ARN for worker nodes"
  value       = aws_iam_role.eks_node_role.arn
}
