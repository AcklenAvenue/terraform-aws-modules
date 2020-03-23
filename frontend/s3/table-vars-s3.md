### Table of variables per module

> __*__ -> shared variable between resources

#### s3_bucket.web_bucket
| variable       | default value |
|:-------------- |:------------- |
| name           |               |
| bucket_acl     | "public-read" |
| bucket_destroy | `true`        |
| index_doc*     | "index.html"  |

#### locals
| variable       | default value |
|:-------------- |:------------- |
| name_prefix*   |               |

#### cloudfront_origin_access_identity.frontend_origin_access_identity
| variable       | default value |
|:-------------- |:------------- |
| name_prefix*   |               |

#### route53_record.frontend-alias-dns-record
| variable           | default value |
|:-----------------  |:------------- |
| zone_id            |               |
| name_prefix*       |               |
| hosted_zone_name*  |               |
| record_type        | "A"           |
| eval_target_health | `true`        |

#### cloudfront_distribution.frontend_s3_distribution
| variable            | default value |
|:-----------------   |:------------- |
| name_prefix*        |               |
| hosted_zone_name*   |               |
| cf_distrib_enabled  | `true`        |
| cf_distrib_ipv6     | `true`        |
| index_doc*          |               |
| aws_certificate_arn |               |
