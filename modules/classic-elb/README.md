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
|:---------         |:------------- |:------ |
| hosted_zone_name* |               | string |

#### elb.sprint0_elb
| variable                | default value | type    |
|:-----------------       |:------------- |:------- |
| name_prefix*            |               | string  |
| public1_subnet_id*      |               | string  |
| public2_subnet_id       |               | string  |
| security_groups         |               | list    |
| listeners               | [{instance_port = 80<br>instance_protocol = "http"<br>lb_port = 80<br>lb_protocol = "http"},<br>{instance_port = 80<br>instance_protocol = "http"<br>lb_port = 443<br>lb_protocol = "https"}] | object |
| elb_healthy_threshold   |               | number  |
| elb_unhealthy_threshold |               | number  |
| elb_timeout             |               | number  |
| elb_target              | "TCP:5000"    | string  |
| elb_interval            |               | number  |
| cross_zone_lb           | ```true```    | boolean |
| idle_timeout            | 400           | number  |
| con_draining            | ```true```    | boolean |
| con_draining_timeout    | 400           | number  |

#### route53_record.backend-dns-record
| variable          | default value | type    |
|:----------------- |:------------- |:------- |
| name_prefix*      |               | string  |
| hosted_zone_name* |               | string  |
| zone_id           |               | string  |
| record_type       | "CNAME"       | string  |
| record_ttl        | 300           | number  |
