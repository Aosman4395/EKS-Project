output "load_balancer_arn" {
  value = aws_lb.ecs_alb.arn
}

output "target_group_arn" {
  value = aws_lb_target_group.ecs_tg.arn
}

output "alb_name" {
  value = aws_lb.ecs_alb.name
}