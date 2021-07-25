resource "aws_lb_listener_rule" "rules" {
  for_each = { for t in var.target_groups : t.name => t }

  listener_arn = aws_lb_listener.listener_443.arn

  action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.target_groups[each.value.name].arn
  }

  condition {
    path_pattern {
      values = [
        each.value.path != "/" ? "${each.value.path}/" : "/",
        each.value.path != "/" ? "${each.value.path}/*" : "/*"
      ]
    }
  }
}