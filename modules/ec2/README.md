### Table of variables per module

> __*__ -> shared variable between resources

Variable types:
  - string  = mytext
  - number  = 123
  - list    = [ "string1", "string2" ]
  - boolean = `true`

---

#### instance.sprint0_bastion
| variable          | default value | type   |
|:----------------- |:------------- |:------ |
| dev_instance_type | "t2.micro"    | string |
| dev_ami*          |               | string |
| name_prefix*      |               | string |
| key_name*         |               | string |
| bastion_sg_id     |               | list   |
| public1_subnet_id |               | string |

#### instance.ec2-first
| variable            | default value | type    |
|:-----------------   |:------------- |:------- |
| lc_instance_type*   |               | string  |
| dev_ami*            |               | string  |
| name_prefix*        |               | string  |
| key_name*           |               | string  |
| sprint0_private_sg* |               | list    |
| private1_subnet_id  |               | string  |

#### instance.ec2-second
| variable            | default value | type    |
|:-----------------   |:------------- |:------- |
| lc_instance_type*   |               | string  |
| dev_ami*            |               | string  |
| name_prefix*        |               | string  |
| key_name*           |               | string  |
| sprint0_private_sg* |               | list    |
| private2_subnet_id  |               | string  |

#### s3_bucket_object.uploadfile
| variable | default value | type    |
|:---------|:------------- |:------- |
| bucket   |               | string  |
| project  |               | string  |
| branch   |               | string  |

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
| sprint0_public_sg       |               | list    |
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