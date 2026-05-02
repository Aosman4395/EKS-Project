module "vpc" {
  source = "../modules/vpc"
}

module "eks" {
  source                = "../modules/eks"
  eks_cluster_name      = var.eks_cluster_name
  private_subnet_ids    = module.vpc.private_subnet_ids
  alb_security_group_id = module.alb.alb_security_group_id
  vpc_id                = module.vpc.vpc_id
}

module "alb" {
  source = "../modules/alb"

  alb_name          = var.alb_name
  alb_sg_name       = var.alb_sg_name
  alb_subnets       = module.vpc.public_subnet_ids
  vpc_id            = module.vpc.vpc_id
  certificate_arn   = var.certificate_arn
  target_group_port = var.target_group_port
}
