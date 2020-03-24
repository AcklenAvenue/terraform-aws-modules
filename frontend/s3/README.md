### Table of variables per module

> __*__ -> shared variable between resources

Variable types:
  - string  = mytext
  - number  = 123
  - list    = [ "string1", "string2" ]
  - boolean = `true`

---

#### s3_bucket.web_bucket
| variable       | default value | type    |
|:-------------- |:------------- |:------- |
| name           |               | string  |
| bucket_acl     | "public-read" | string  |
| bucket_destroy | `true`        | boolean |
| index_doc*     | "index.html"  | string  |

#### locals
| variable       | default value | type    |
|:-------------- |:------------- |:------- |
| name_prefix*   |               | string  |

#### cloudfront_origin_access_identity.frontend_origin_access_identity
| variable       | default value | type    |
|:-------------- |:------------- |:------- |
| name_prefix*   |               | string  |

#### route53_record.frontend-alias-dns-record
| variable           | default value | type    |
|:-----------------  |:------------- |:------- |
| zone_id            |               | string  |
| name_prefix*       |               | string  |
| hosted_zone_name*  |               | string  |
| record_type        | "A"           | string  |
| eval_target_health | `true`        | boolean |

#### cloudfront_distribution.frontend_s3_distribution
| variable            | default value | type    |
|:-----------------   |:------------- |:------- |
| name_prefix*        |               | string  |
| hosted_zone_name*   |               | string  |
| cf_distrib_enabled  | `true`        | boolean |
| cf_distrib_ipv6     | `true`        | boolean |
| index_doc*          | "index.html"  | string  |
| aws_certificate_arn |               | string  |
