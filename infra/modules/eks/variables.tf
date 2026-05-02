variable "eks_cluster_name" {
  description = "The name of the EKS cluster"
  type        = string
  default     = "eks-cluster"
}

variable "private_subnet_ids" {
  description = "The IDs of the private subnets for the EKS cluster"
  type        = list(string)

}

variable "alb_security_group_id" {
  description = "The IDs of the security groups for the Application Load Balancer"
  type        = string
}

variable "vpc_id" {
  description = "The ID of the VPC for the EKS cluster"
  type        = string
}