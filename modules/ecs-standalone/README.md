## Requirements

No requirements.

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_consul_cluster"></a> [consul\_cluster](#module\_consul\_cluster) | AcklenAvenue/modules/aws//modules/consul | 0.0.5 |
| <a name="module_ecs"></a> [ecs](#module\_ecs) | AcklenAvenue/modules/aws//modules/ecs | 0.0.5 |
| <a name="module_ingress"></a> [ingress](#module\_ingress) | AcklenAvenue/modules/aws//modules/nginx-ingress | 0.0.5 |
| <a name="module_loadbalancer"></a> [loadbalancer](#module\_loadbalancer) | AcklenAvenue/modules/aws//modules/loadbalancer | 0.0.5 |
| <a name="module_network"></a> [network](#module\_network) | AcklenAvenue/modules/aws//modules/network | 0.0.5 |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_consul"></a> [consul](#input\_consul) | The Consul master nodes configuration | <pre>object({<br>    consul_version   = string<br>    key_name         = string<br>    instance_type    = string<br>    min_size         = number<br>    desired_capacity = number<br>    max_size         = number<br>    encryption_key   = string<br>  })</pre> | <pre>{<br>  "consul_version": "1.9.5",<br>  "desired_capacity": 1,<br>  "encryption_key": "0enygkRn7c3zr8BV1XoziHONF5xcVo+UKo1eE1VDR6E=",<br>  "instance_type": "t3.micro",<br>  "key_name": "AA-DevOps",<br>  "max_size": 1,<br>  "min_size": 1<br>}</pre> | no |
| <a name="input_domain"></a> [domain](#input\_domain) | Domain name for TLS certificates | `string` | n/a | yes |
| <a name="input_ecs"></a> [ecs](#input\_ecs) | The ECS cluster configuration | <pre>object({<br>    instance_type    = string<br>    key_name         = string<br>    min_size         = number<br>    desired_capacity = number<br>    max_size         = number<br>  })</pre> | <pre>{<br>  "desired_capacity": 1,<br>  "instance_type": "t3.micro",<br>  "key_name": "AA-DevOps",<br>  "max_size": 1,<br>  "min_size": 1<br>}</pre> | no |
| <a name="input_environment"></a> [environment](#input\_environment) | Name of the environment | `string` | n/a | yes |
| <a name="input_project"></a> [project](#input\_project) | Name of the project | `string` | n/a | yes |
| <a name="input_version_string"></a> [version\_string](#input\_version\_string) | Version of the infrastructure | `string` | n/a | yes |

## Outputs

No outputs.
