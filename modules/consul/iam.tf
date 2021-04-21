resource "aws_iam_role" "role" {
  name               = local.name_prefix
  assume_role_policy = file("${path.module}/files/policies/role-policy.json")

  tags = merge(local.tags, { Name = local.name_prefix })
}

resource "aws_iam_role_policy" "policy" {
  name   = local.name_prefix
  role   = aws_iam_role.role.id
  policy = file("${path.module}/files/policies/policy.json")
}

resource "aws_iam_instance_profile" "instance_profile" {
  name = local.name_prefix
  role = aws_iam_role.role.name

  tags = merge(local.tags, { Name = local.name_prefix })
}
