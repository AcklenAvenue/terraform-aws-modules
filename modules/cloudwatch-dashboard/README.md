## Requirements

No requirements.

## Providers

| Name                                                            | Version |
| --------------------------------------------------------------- | ------- |
| <a name="provider_aws"></a> [aws](#provider_aws)                | n/a     |
| <a name="provider_template"></a> [template](#provider_template) | n/a     |

## Modules

No modules.

## Resources

| Name                                                                                                                                           | Type        |
| ---------------------------------------------------------------------------------------------------------------------------------------------- | ----------- |
| [aws_cloudwatch_dashboard.wp_site_dashboard](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_dashboard) | resource    |
| [template_file.autoscaling](https://registry.terraform.io/providers/hashicorp/template/latest/docs/data-sources/file)                          | data source |
| [template_file.cloudfront](https://registry.terraform.io/providers/hashicorp/template/latest/docs/data-sources/file)                           | data source |
| [template_file.cloudwatchDashboard](https://registry.terraform.io/providers/hashicorp/template/latest/docs/data-sources/file)                  | data source |
| [template_file.ecs](https://registry.terraform.io/providers/hashicorp/template/latest/docs/data-sources/file)                                  | data source |
| [template_file.rds](https://registry.terraform.io/providers/hashicorp/template/latest/docs/data-sources/file)                                  | data source |
| [template_file.rdsCluster](https://registry.terraform.io/providers/hashicorp/template/latest/docs/data-sources/file)                           | data source |

## Inputs

| Name                                                                              | Description                                                                                              | Type     | Default       | Required |
| --------------------------------------------------------------------------------- | -------------------------------------------------------------------------------------------------------- | -------- | ------------- | :------: |
| <a name="input_autoscaling_name"></a> [autoscaling_name](#input_autoscaling_name) | Adds metrics of Autoscaling Groups to dashboard by using autoscaling group name                          | `string` | `""`          |    no    |
| <a name="input_aws_region"></a> [aws_region](#input_aws_region)                   | AWS Region                                                                                               | `string` | `"us-east-1"` |    no    |
| <a name="input_cloudfront_id"></a> [cloudfront_id](#input_cloudfront_id)          | Adds metrics of Cloudfront to dashboard by using Cloudfront ID                                           | `string` | `""`          |    no    |
| <a name="input_ecs_name"></a> [ecs_name](#input_ecs_name)                         | Adds metrics of Elastic Container Service to dashboard by using Elastic Container Service Name           | `string` | `""`          |    no    |
| <a name="input_environment"></a> [environment](#input_environment)                | Name of the environment                                                                                  | `string` | n/a           |   yes    |
| <a name="input_project"></a> [project](#input_project)                            | Name of the project                                                                                      | `string` | n/a           |   yes    |
| <a name="input_rdsCluster_id"></a> [rdsCluster_id](#input_rdsCluster_id)          | Adds metrics of Relational Database Cluster to dashboard by using Relational Database Cluster Identifier | `string` | `""`          |    no    |
| <a name="input_rds_id"></a> [rds_id](#input_rds_id)                               | Adds metrics of Relational Database Service to dashboard by using Relational Database Service Identifier | `string` | `""`          |    no    |

## Outputs

No outputs.

# How to use it

- The only thing required when using this module is to give the specified inputs and the defaults metrics will be automatically created
- It only works if resources are in the same region
