### Table of variables per module

> __*__ -> shared variable between resources

Variable types:
  - string  = mytext
  - number  = 123
  - list    = [ "string1", "string2" ]
  - boolean = `true`

---
#### db_snapshot.db_snapshot
| variable         | default value | type    |
|:---------------- |:------------- |:------- |
| most_recent      | `true`        | boolean |
| db_snapshot_name |               | string  |

##### db_instance.db_uat
| variable               | default value | type    |
|:--------------------   |:------------- |:------- |
| db_instance_type       | "db.t2.micro" | string  |
| name_prefix*           |               | string  |
| db_username            |               | string  |
| db_password            |               | string  |
| db_subnet_group_name   |               | string  |
| vpc_security_group_ids |               | list    |
| db_skip_final_snap     | `true`        | boolean |
| db_public_access       | `true`        | boolean |

#### route53_record.dns_record
| variable         | default value | type   |
|:-----------------|:------------- |:------ |
| zone_id          |               | string |
| name_prefix*     |               | string |
| hosted_zone_name |               | string |
| record_type      | "CNAME"       | string |
| record_ttl       | 300           | number |