variable "alb_name" {
  description = "The name of the Application Load Balancer"
  type        = string
  default     = "eks-alb"
}


variable "alb_security_group_name" {
  description = "The name of the security group for the Application Load Balancer"
  type        = string
  default     = "eks-alb-sg"
}


variable "vpc_id" {
  description = "The VPC ID for the Application Load Balancer"
  type        = string
}

variable "certificate_arn" {
  description = "The ARN of the ACM certificate for HTTPS listener"
  type        = string
  default     = ""
  
}

variable "target_group_port" {
  description = "The port for the target group"
  type        = number
  default     = 8081
}


variable "alb_sg_name" {
  description = "The name of the security group for the Application Load Balancer"
  type        = string
  default     = "eks-alb-sg"
}

variable "alb_security_group_ids" {
  description = "The security group IDs for the Application Load Balancer"
  type        = list(string)
}

variable "public_subnet_ids" {
  description = "The IDs of the public subnets for the Application Load Balancer"
  type        = list(string)
}