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
| [aws_eip.elastic_ip](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/eip) | resource |
| [aws_internet_gateway.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/internet_gateway) | resource |
| [aws_nat_gateway.nat_gateway](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/nat_gateway) | resource |
| [aws_route_table.private_route_table](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table) | resource |
| [aws_route_table.public_route_table](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table) | resource |
| [aws_route_table_association.private_route_table_association](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table_association) | resource |
| [aws_route_table_association.public_route_table_association](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table_association) | resource |
| [aws_security_group.security_groups](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group) | resource |
| [aws_security_group_rule.egress](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group_rule) | resource |
| [aws_security_group_rule.ingress](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group_rule) | resource |
| [aws_subnet.private_subnets](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet) | resource |
| [aws_subnet.public_subnets](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet) | resource |
| [aws_vpc.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_cidr_block"></a> [cidr\_block](#input\_cidr\_block) | Main vpc cidr block | `string` | `"10.0.0.0/16"` | no |
| <a name="input_environment"></a> [environment](#input\_environment) | Name of the environment | `string` | n/a | yes |
| <a name="input_natgateway_mapping"></a> [natgateway\_mapping](#input\_natgateway\_mapping) | The Subnet names in which the NAT gateways will be placed | <pre>set(object({<br>    public_subnet   = string<br>    private_subnets = list(string)<br>  }))</pre> | `[]` | no |
| <a name="input_private_subnets"></a> [private\_subnets](#input\_private\_subnets) | Private subnets configuration. | <pre>set(object({<br>    name              = string<br>    availability_zone = string<br>    cidr_block        = string<br>  }))</pre> | n/a | yes |
| <a name="input_project"></a> [project](#input\_project) | Name of the project | `string` | n/a | yes |
| <a name="input_public_subnets"></a> [public\_subnets](#input\_public\_subnets) | Public subnets configuration | <pre>set(object({<br>    name              = string<br>    availability_zone = string<br>    cidr_block        = string<br>  }))</pre> | n/a | yes |
| <a name="input_security_groups"></a> [security\_groups](#input\_security\_groups) | Security groups configuration that doesn't depend on any other security group | <pre>set(object({<br>    name        = string<br>    description = string<br>    ingress = set(object({<br>      from_port      = number<br>      to_port        = number<br>      protocol       = string<br>      cidr_blocks    = list(string)<br>      security_group = string<br>    }))<br>    egress = set(object({<br>      from_port      = number<br>      to_port        = number<br>      protocol       = string<br>      cidr_blocks    = list(string)<br>      security_group = string<br>    }))<br>  }))</pre> | n/a | yes |
| <a name="input_version_string"></a> [version\_string](#input\_version\_string) | Version of the infrastructure | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_private_subnets_cidrs"></a> [private\_subnets\_cidrs](#output\_private\_subnets\_cidrs) | Available private subnet ids |
| <a name="output_private_subnets_ids"></a> [private\_subnets\_ids](#output\_private\_subnets\_ids) | Available private subnet ids |
| <a name="output_public_subnets_cidrs"></a> [public\_subnets\_cidrs](#output\_public\_subnets\_cidrs) | Available public subnet ids |
| <a name="output_public_subnets_ids"></a> [public\_subnets\_ids](#output\_public\_subnets\_ids) | Available public subnet ids |
| <a name="output_security_group_ids"></a> [security\_group\_ids](#output\_security\_group\_ids) | Security groups ids |
| <a name="output_vpc_id"></a> [vpc\_id](#output\_vpc\_id) | Main vpc id |
