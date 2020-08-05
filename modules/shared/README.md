```
# terraform apply -var name=monkey -var vpc_cidr=10.0.0.0/16
```

## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| aws | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| name | Name used in the resources. | `any` | n/a | yes |
| vpc\_cidr | The CIDR block of the VPC. | `any` | n/a | yes |

## Outputs

No output.