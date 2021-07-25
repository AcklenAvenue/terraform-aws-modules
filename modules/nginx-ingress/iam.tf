resource "aws_iam_role" "ecs_host_role" {
  name               = "${local.name_prefix}-nginx-instance-role"
  assume_role_policy = file("${path.module}/files/policies/nginx-role.json")
}

resource "aws_iam_role_policy" "ecs_instance_role_policy" {
  name   = "${local.name_prefix}-nginx-instance-policy"
  policy = file("${path.module}/files/policies/nginx-instance-role-policy.json")
  role   = aws_iam_role.ecs_host_role.id
}

resource "aws_iam_role" "ecs_service_role" {
  name               = "${local.name_prefix}-nginx-service-role"
  assume_role_policy = file("${path.module}/files/policies/nginx-role.json")
}

resource "aws_iam_role_policy" "ecs_service_role_policy" {
  name   = "${local.name_prefix}-nginx-service-policy"
  policy = file("${path.module}/files/policies/nginx-service-role-policy.json")
  role   = aws_iam_role.ecs_service_role.id
}

resource "aws_iam_instance_profile" "ecs" {
  name = "${local.name_prefix}-nginx-instance-profile"
  path = "/"
  role = aws_iam_role.ecs_host_role.name
}
