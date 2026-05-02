module "vpc" {
  source = "../modules/vpc"
}

module "sgs" {
  source = "../modules/sgs"

  vpc_id      = module.vpc.vpc_id
  alb_sg_name = var.alb_sg_name
}

module "alb" {
  source = "../modules/alb"

  alb_name               = var.alb_name
  alb_security_group_ids = [module.sgs.alb_sg_id]
  public_subnet_ids      = module.vpc.public_subnet_ids
  certificate_arn        = var.certificate_arn
  target_group_port      = var.target_group_port
  vpc_id                 = module.vpc.vpc_id
}

module "eks" {
  source                = "../modules/eks"
  eks_cluster_name      = var.eks_cluster_name
  private_subnet_ids    = module.vpc.private_subnet_ids
  alb_security_group_id = module.sgs.alb_sg_id
  vpc_id                = module.vpc.vpc_id
}