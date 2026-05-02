variable "aws_region" {
  description = "The AWS region to deploy resources"
  type        = string
  default     = "eu-west-2"
}

variable "s3_name" {
  description = "The name of the S3 bucket for Terraform state"
  type        = string
  default     = "ahamed-eks-project-s3"
}

variable "ecr_name" {
  description = "The name of the ECR repository"
  type        = string
  default     = "ahamed-eks-project-ecr"
}

variable "domain_name" {
  description = "The domain name for ACM certificate"
  type        = string
  default     = "eks.ahmedo.co.uk"
}

variable "alb_name" {
  description = "The name of the Application Load Balancer"
  type        = string
  default     = "my-alb"
}

variable "target_group_port" {
  description = "The port for the ALB target group"
  type        = number
  default     = 8081
}

variable "alb_sg_name" {
  description = "The security group name for the Application Load Balancer"
  type        = string
  default     = "eks-alb-sg"
}

variable "eks_cluster_name" {
  description = "The name of the EKS cluster"
  type        = string
  default     = "eks-cluster"
}

variable "vpc_name" {
  description = "The name of the VPC"
  type        = string
  default     = "eks-vpc"
}

variable "certificate_arn" {
  description = "The ARN of the ACM certificate for HTTPS listener"
  type        = string
  default     = "arn:aws:acm:eu-west-2:409987738946:certificate/43b4808a-aa96-4cb4-a27e-687336336cb3"
}