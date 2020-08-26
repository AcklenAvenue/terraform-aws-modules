## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| aws | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| aws\_access\_key\_id | The AWS access key ID | `string` | n/a | yes |
| aws\_region | The AWS Region. | `string` | n/a | yes |
| aws\_secret\_access\_key | The AWS secret access key. | `string` | n/a | yes |
| domain | Name of the hosted zone in Route53. | `string` | n/a | yes |
| instance\_type | EC2 instance type. | `string` | n/a | yes |
| key\_name | EC2 SSH pair name. | `string` | n/a | yes |
| name | Name used in the resources. | `string` | n/a | yes |
| vpc\_cidr | The CIDR block of the VPC. | `any` | n/a | yes |

## Outputs

No output.