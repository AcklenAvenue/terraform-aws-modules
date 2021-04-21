## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_autoscaling_group.autoscaling_group](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/autoscaling_group) | resource |
| [aws_iam_instance_profile.instance_profile](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_instance_profile) | resource |
| [aws_iam_role.role](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role_policy.policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy) | resource |
| [aws_launch_template.launch_configuration](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/launch_template) | resource |
| [aws_ami.consul](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/ami) | data source |
| [aws_region.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/region) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_consul_version"></a> [consul\_version](#input\_consul\_version) | AMI consul version | `string` | n/a | yes |
| <a name="input_desired_capacity"></a> [desired\_capacity](#input\_desired\_capacity) | The number of Amazon EC2 instances that should be running in the group | `number` | n/a | yes |
| <a name="input_encryption_key"></a> [encryption\_key](#input\_encryption\_key) | n/a | `string` | n/a | yes |
| <a name="input_environment"></a> [environment](#input\_environment) | Name of the environment | `string` | n/a | yes |
| <a name="input_instance_type"></a> [instance\_type](#input\_instance\_type) | The type of the instance | `string` | n/a | yes |
| <a name="input_key_name"></a> [key\_name](#input\_key\_name) | The key name to use for the instance | `string` | n/a | yes |
| <a name="input_max_size"></a> [max\_size](#input\_max\_size) | The maximum size of the Auto Scaling Group | `number` | n/a | yes |
| <a name="input_min_size"></a> [min\_size](#input\_min\_size) | he minimum size of the Auto Scaling Group | `number` | n/a | yes |
| <a name="input_project"></a> [project](#input\_project) | Name of the project | `string` | n/a | yes |
| <a name="input_security_group_ids"></a> [security\_group\_ids](#input\_security\_group\_ids) | A list of security group IDs to associate | `list(string)` | n/a | yes |
| <a name="input_subnet_ids"></a> [subnet\_ids](#input\_subnet\_ids) | A list of subnet IDs to launch resources in | `list(string)` | n/a | yes |
| <a name="input_version_string"></a> [version\_string](#input\_version\_string) | Version of the infrastructure | `string` | n/a | yes |

## Outputs

No outputs.
