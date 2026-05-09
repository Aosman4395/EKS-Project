output "alb_name" {
  value = module.alb.alb_name
}

output "external_dns_role_arn" {
  value = module.external_dns_iam.external_dns_role_arn
}