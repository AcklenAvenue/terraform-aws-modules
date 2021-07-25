resource "aws_iam_role" "ecs_host_role" {
  name               = "${local.name_prefix}-ecs-instance-role"
  assume_role_policy = file("${path.module}/files/policies/ecs-role.json")
}

resource "aws_iam_role_policy" "ecs_instance_role_policy" {
  name   = "${local.name_prefix}-ecs-instance-policy"
  policy = file("${path.module}/files/policies/ecs-instance-role-policy.json")
  role   = aws_iam_role.ecs_host_role.id
}

resource "aws_iam_role" "ecs_service_role" {
  name               = "${local.name_prefix}-ecs-service-role"
  assume_role_policy = file("${path.module}/files/policies/ecs-role.json")
}

resource "aws_iam_role_policy" "ecs_service_role_policy" {
  name   = "${local.name_prefix}-ecs-service-policy"
  policy = file("${path.module}/files/policies/ecs-service-role-policy.json")
  role   = aws_iam_role.ecs_service_role.id
}

resource "aws_iam_instance_profile" "ecs" {
  name = "${local.name_prefix}-ecs-instance-profile"
  role = aws_iam_role.ecs_host_role.name

  tags = merge(local.tags, { Name = local.name_prefix })
}
