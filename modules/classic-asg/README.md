### Table of variables per module

> __*__ -> shared variable between resources

Variable types:
  - string  = mytext
  - number  = 123
  - list    = [ "string1", "string2" ]
  - boolean = `true`

---

#### aws_launch_configuration.launchconfiguration
| variable         | default value | type   |
|:--------------   |:------------- |:------ |
| name_prefix*     |               | string |
| image_id         |               | string |
| lc_instance_type |               | string |
| key_name         |               | string |
| security_groups  |               | list   |

#### aws_autoscaling_group.autoscaling-project
| variable                  | default value | type    |
|:---------------------     |:------------- |:------- |
| name_prefix*              |               | string  |
| project_name*             |               | string  |
| min_size_asg              |               | number  |
| max_size_asg              |               | number  |
| health_check_grace_period | 300           | number  |
| health_check_type         | ELB           | string  |
| classic_lb_names          |               | list    |
| force_delete              | true          | boolean |
| private1_subnet_id        |               | string  |
| private2_subnet_id        |               | string  |

#### aws_autoscaling_schedule.schedule-turnoff
| variable                 | default value       | type    |
|:---------------------    |:------------------- |:------- |
| turnoff_scheduled_action | Shutdown-Mon-Friday | string  |
| turnoff_recurrence       | 0 0 * * 2-6         | string  |
| turnoff_min_size         | 0                   | number  |
| turnoff_max_size         |                     | number  |
| turnoff_desired_capacity | 0                   | number  |

#### aws_autoscaling_schedule.schedule-turnon
| variable                | default value      | type    |
|:---------------------   |:-----------------  |:------- |
| turnon_scheduled_action | Turn on-Mon-Friday | string  |
| turnon_recurrence       | 30 12 * * 2-6      | string  |
| turnon_min_size         |                    | number  |
| turnon_max_size         |                    | number  | 
| turnon_desired_capacity | 2                  | number  | 
