### Table of variables per module

> __*__ -> shared variable between resources

#### security_group.sprint0_bastion_sg
| variable            | default value |
|:------------------  |:------------- |
| name_prefix*        |               |
| vpc_id*             |               |
| allowed_ssh_ip      |               |
| bastion_egress_cidr | ["0.0.0.0/0"] |

#### security_group.sprint0_public_sg
| variable            | default value |
|:------------------  |:------------- |
| name_prefix*        |               |
| vpc_id*             |               |
| public_sg_ingress   | [{from_port = 80<br>to_port = 80<br>protocol = "tcp"<br>cidr_blocks = ["0.0.0.0/0"]},<br>{from_port = 443<br>to_port = 443<br>protocol = "tcp"<br>cidr_block = ["0.0.0.0/0"]}] |
| public_egress_cidr  | ["0.0.0.0/0"] |

#### security_group.sprint0_private_sg
| variable             | default value |
|:------------------   |:------------- |
| name_prefix*         |               |
| vpc_id*              |               |
| private_ingress_cidr |               |
| private_egress_cidr  | ["0.0.0.0/0"] |

#### security_group.sprint0_rds_sg
| variable     | default value |
|:-------------|:------------- |
| name_prefix* |               |
| vpc_id*      |               |
| db_port      |               |