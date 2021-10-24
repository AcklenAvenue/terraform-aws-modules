### Table of variables per module

> __*__ -> shared variable between resources

Variable types:
  - string  = mytext
  - number  = 123
  - list    = [ "string1", "string2" ]
  - boolean = `true`

---

#### instance.ec2-instance
| variable          | default value | type   |
|:----------------- |:------------- |:------ |
| dev_instance_type | "t2.micro"    | string |
| dev_ami*          |               | string |
| name_prefix*      |               | string |
| key_name*         |               | string |
| sg_id             |               | list   |
| public1_subnet_id |               | string |
