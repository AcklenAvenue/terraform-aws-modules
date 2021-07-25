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
