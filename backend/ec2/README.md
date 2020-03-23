### Table of variables per module

> __*__ -> shared variable between resources

#### instance.sprint0_bastion
| variable          | default value |
|:----------------- |:------------- |
| dev_instance_type | "t2.micro"    |
| dev_ami*          |               |
| name_prefix*      |               |
| key_name*         |               |
| bastion_sg_id     |               |
| public1_subnet_id |               |

#### instance.ec2-first
| variable            | default value |
|:-----------------   |:------------- |
| lc_instance_type*   |               |
| dev_ami*            |               |
| name_prefix*        |               |
| key_name*           |               |
| sprint0_private_sg* |               |
| private1_subnet_id  |               |

#### instance.ec2-second
| variable            | default value |
|:-----------------   |:------------- |
| lc_instance_type*   |               |
| dev_ami*            |               |
| name_prefix*        |               |
| key_name*           |               |
| sprint0_private_sg* |               |
| private2_subnet_id  |               |

#### s3_bucket_object.uploadfile
| variable | default value |
|:---------|:------------- |
| bucket   |               |
| project  |               |
| branch   |               |

#### aws_acm_certificate.certificate
| variable          | default value |
|:---------         |:------------- |
| hosted_zone_name* |               |

#### elb.sprint0_elb
| variable                | default value |
|:-----------------       |:------------- |
| name_prefix*            |               |
| public1_subnet_id*      |               |
| public2_subnet_id       |               |
| sprint0_public_sg       |               |
| listeners               | [{instance_port = 80<br>instance_protocol = "http"<br>lb_port = 80<br>lb_protocol = "http"},<br>{instance_port = 80<br>instance_protocol = "http"<br>lb_port = 443<br>lb_protocol = "https"}] |
| elb_healthy_threshold   |               |
| elb_unhealthy_threshold |               |
| elb_timeout             |               |
| elb_target              | "TCP:5000"    |
| elb_interval            |               |
| cross_zone_lb           | ```true```    |
| idle_timeout            | 400           |
| con_draining            | ```true```    |
| con_draining_timeout    | 400           |

#### route53_record.backend-dns-record
| variable          | default value |
|:----------------- |:------------- |
| name_prefix*      |               |
| hosted_zone_name* |               |
| zone_id           |               |
| record_type       | "CNAME"       |
| record_ttl        | 300           |