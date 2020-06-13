### Table of variables per module

> __*__ -> shared variable between resources

Variable types:
  - string  = mytext
  - number  = 123
  - list    = [ "string1", "string2" ]
  - boolean = `true`

---

#### cloudwatch_log_group.loggroup
| variable       | default value | type   |
|:-------------  |:------------- |:------ |
| name_prefix*   |               | string |
| retention_days | 3             | number |

#### cloudwatch_log_group.logstream
| variable     | default value | type   |
|:-------------|:------------- |:------ |
| name_prefix* |               | string |
