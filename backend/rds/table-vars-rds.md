### Table of variables per module

> __*__ -> shared variable between resources

#### terraform s3
| variable    | default value |
|:------------|:------------- |
| bucket      |               |
| aws_region* |               |

#### provider aws
| variable    | default value |
|:------------|:------------- |
| aws_region* |               |

#### db_snapshot.db_snapshot
| variable         | default value |
|:---------------- |:------------- |
| most_recent      | `true`        |
| db_snapshot_name |               |

##### db_instance.db_uat
| variable               | default value |
|:--------------------   |:------------- |
| db_instance_type       | "db.t2.micro" |
| name_prefix*           |               |
| db_username            |               |
| db_password            |               |
| db_subnet_group_name   |               |
| vpc_security_group_ids |               |
| db_skip_final_snap     | `true`        |
| db_public_access       | `true`        |

#### route53_record.dns_record
| variable         | default value |
|:-----------------|:------------- |
| zone_id          |               |
| name_prefix*     |               |
| hosted_zone_name |               |
| record_type      | "CNAME"       |
| record_ttl       | 300           |