### Table of variables per module

> __*__ -> shared variable between resources

Variable types:
  - string  = mytext
  - number  = 123
  - list    = [ "string1", "string2" ]
  - boolean = `true`

---

#### aws_acm_certificate.certificate
| variable          | default value | type   |
|:---------------   |:------------- |:------ |
| hosted_zone_name* |               | string |

#### aws_lb.application-loadbalancer
| variable                  | default value | type     |
|:---------------------     |:------------- |:-------- |
| name_prefix*              |               | string   |
| lb_internal               | `false`       | boolean  |
| lb_type                   | "application" | string   |
| public1_subnet_id         |               | string   |
| public2_subnet_id         |               | string   |
| security_groups           |               | list     |
| enable_del_protection     | `false`       | boolean  |

#### aws_lb_target_group.app_lb_tgt_atscaling
| variable              | default value | type    |
|:------------------    |:------------  |:------- |
| name_prefix*          |               | string  |
| target_group_port     | 5000          | number  |
| target_group_protocol | "HTTP"        | string  |
| vpc_id                |               | string  |
| health_check_protocol | "HTTP"        | string  |
| health_check_path     | /api/status   | string  |
| healthy_threshold     | 3             | number  |
| unhealthy_threshold   | 10            | number  |
| health_check_timeout  | 5             | number  |
| health_check_interval | 10            | number  |

#### route53_record.backend-dns-record
| variable           | default value | type    |
|:-----------------  |:------------- |:------- |
| name_prefix*       |               | string  |
| hosted_zone_name*  |               | string  |
| zone_id            |               | string  |
| record_type        | "A"           | string  |
| eval_target_health | `false`       | boolean |
