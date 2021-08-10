### Table of variables per module

> __*__ -> shared variable between resources

Variable types:
  - string  = mytext
  - number  = 123
  - list    = [ "string1", "string2" ]
  - boolean = `true`

---

#### vpc.sprint0_vpc
| variable           | default value | type    |
|:-----------------  |:------------- |:------- |
| vpc_cidr           |               | string  |
| enable_dns_host    | `true`        | boolean |
| enable_dns_support | `true`        | boolean |
| name_prefix*       |               | string  |

#### internet_gateway.sprint0_internet_gateway
| variable     | default value | type   |
|:-------------|:------------- |:------ |
| name_prefix* |               | string |
| project_name*|               | string |

#### eip.sprint0_eip
| variable     | default value | type    |
|:-------------|:------------- |:------- |
| eip_vpc      | `true`        | boolean |
| name_prefix* |               | string  |
| project_name*|               | string  |

#### route_table.sprint0_public_rt
| variable       | default value | type   |
|:---------------|:------------- |:------ |
| rt_public_cidr | "0.0.0.0/0"   | string |
| name_prefix*   |               | string |
| project_name*  |               | string |

#### default_route_table.sprint0_private_rt
| variable         | default value | type   |
|:---------------- |:------------- |:------ |
| rt_private_cidr  | "0.0.0.0/0"   | string |
| name_prefix*     |               | string |
| project_name*    |               | string |

#### subnet.sprint0_public1_subnet
| variable       | default value | type    |
|:---------------|:------------- |:------- |
| cidrs[]*       |               | map     |
| public_ip_map* | `true`        | boolean |
| name_prefix*   |               | string  |
| project_name*  |               | string  |

#### subnet.sprint0_public2_subnet
| variable       | default value | type    |
|:---------------|:------------- |:------- |
| cidrs[]*       |               | map     |
| public_ip_map* | `true`        | boolean |
| name_prefix*   |               | string  |
| project_name*  |               | string  |

#### subnet.sprint0_private1_subnet
| variable        | default value | type    |
|:----------------|:------------- |:------- |
| cidrs[]*        |               | map     |
| private_ip_map* | `false`       | boolean |
| name_prefix*    |               | string  |
| project_name*   |               | string  |

#### subnet.sprint0_private2_subnet
| variable        | default value | type    |
|:----------------|:------------- |:------- |
| cidrs[]*        |               | map     |
| private_ip_map* | `false`       | boolean |
| name_prefix*    |               | string  |
| project_name*   |               | string  |

#### subnet.sprint0_rds1_subnet
| variable     | default value | type    |
|:-------------|:------------- |:------- |
| cidrs[]*     |               | map     |
| rds_ip_map*  | `false`       | boolean |
| name_prefix* |               | string  |
| project_name*|               | string  |

#### subnet.sprint0_rds2_subnet
| variable     | default value | type    |
|:-------------|:------------- |:------- |
| cidrs[]*     |               | map     |
| rds_ip_map*  | `false`       | boolean |
| name_prefix* |               | string  |
| project_name*|               | string  |

#### nat_gateway.sprint0-nat
| variable     | default value |
|:-------------|:------------- |
| name_prefix* |               |
| project_name*|               |

#### db_subnet_group.sprint0_rds_subnetgroup
| variable     | default value | type    |
|:-------------|:------------- |:------- |
| name_prefix* |               | string  |
| project_name*|               | string  |
