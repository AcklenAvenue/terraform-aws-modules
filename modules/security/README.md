### Table of variables per module

> __*__ -> shared variable between resources

Variable types:
  - string  = mytext
  - number  = 123
  - list    = [ "string1", "string2" ]
  - boolean = `true`

---

#### security_group.sprint0_bastion_sg
| variable            | default value | type    |
|:------------------  |:------------- |:------- |
| name_prefix*        |               | string  |
| project_name*       |               | string  |
| vpc_id*             |               | string  |
| allowed_ssh_ip      |               | list    |
| bastion_egress_cidr | ["0.0.0.0/0"] | list    |

#### security_group.sprint0_public_sg
| variable            | default value | type    |
|:------------------  |:------------- |:------- |
| name_prefix*        |               | string  |
| project_name*       |               | string  |
| vpc_id*             |               | string  |
| public_sg_ingress   | [{from_port = 80<br>to_port = 80<br>protocol = "tcp"<br>cidr_blocks = ["0.0.0.0/0"]},<br>{from_port = 443<br>to_port = 443<br>protocol = "tcp"<br>cidr_block = ["0.0.0.0/0"]}] | object  |
| public_egress_cidr  | ["0.0.0.0/0"] | list    |

#### security_group.sprint0_private_sg
| variable             | default value | type    |
|:------------------   |:------------- |:------- |
| name_prefix*         |               | string  |
| project_name*       |               | string  |
| vpc_id*              |               | string  |
| private_ingress_cidr |               | list    |
| private_egress_cidr  | ["0.0.0.0/0"] | list    |

#### security_group.sprint0_rds_sg
| variable     | default value | type   |
|:-------------|:------------- |:------ |
| name_prefix* |               | string |
| project_name*|               | string |
| vpc_id*      |               | string |
| db_port      |               | number |
