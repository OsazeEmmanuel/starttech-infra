module "networking" {
  source = "./modules/networking"

  vpc_cidr             = var.vpc_cidr
  public_subnet_cidrs  = var.public_subnet_cidrs
  private_subnet_cidrs = var.private_subnet_cidrs
  #  availability_zones   = var.availability_zones
}

module "eks" {
  source = "./modules/eks"

  cluster_name       = var.cluster_name
  cluster_version    = var.cluster_version
  vpc_id             = module.networking.vpc_id
  private_subnet_ids = module.networking.private_subnet_ids
}

module "storage" {
  source = "./modules/storage"

  frontend_bucket_name = var.frontend_bucket_name
  ecr_repository_name  = var.ecr_repository_name
}

module "database" {
  source = "./modules/database"

  vpc_id                        = module.networking.vpc_id
  private_subnet_ids            = module.networking.private_subnet_ids
  eks_cluster_security_group_id = module.eks.cluster_security_group_id
}
#module "cdn" {
 # source        = "./modules/cdn"
  #bucket_name   = module.storage.frontend_bucket_name
 # bucket_domain = module.storage.frontend_bucket_regional_domain_name
#
 # alb_dns_name = "example.com"
#
 # tags = var.tags
#}
