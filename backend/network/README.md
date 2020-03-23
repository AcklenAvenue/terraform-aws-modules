### Table of variables per module

> __*__ -> shared variable between resources

#### vpc.sprint0_vpc
| variable           | default value |
|:-----------------  |:------------- |
| vpc_cidr           |               |
| enable_dns_host    | `true`        |
| enable_dns_support | `true`        |
| name_prefix*       |               |

#### internet_gateway.sprint0_internet_gateway
| variable     | default value |
|:-------------|:------------- |
| name_prefix* |               |

#### eip.sprint0_eip
| variable     | default value |
|:-------------|:------------- |
| eip_vpc      | `true`        |
| name_prefix* |               |

#### route_table.sprint0_public_rt
| variable       | default value |
|:---------------|:------------- |
| rt_public_cidr | "0.0.0.0/0"   |
| name_prefix*   |               |

#### default_route_table.sprint0_private_rt
| variable         | default value |
|:---------------- |:------------- |
| rt_private_cidr  | "0.0.0.0/0"   |
| name_prefix*     |               |

#### subnet.sprint0_public1_subnet
| variable       | default value |
|:---------------|:------------- |
| cidrs[]*       |               |
| public_ip_map* | `true`        |
| name_prefix*   |               |

#### subnet.sprint0_public2_subnet
| variable       | default value |
|:---------------|:------------- |
| cidrs[]*       |               |
| public_ip_map* | `true`        |
| name_prefix*   |               |

#### subnet.sprint0_private1_subnet
| variable        | default value |
|:----------------|:------------- |
| cidrs[]*        |               |
| private_ip_map* | `false`       |
| name_prefix*    |               |

#### subnet.sprint0_private2_subnet
| variable        | default value |
|:----------------|:------------- |
| cidrs[]*        |               |
| private_ip_map* | `false`       |
| name_prefix*    |               |

#### subnet.sprint0_rds1_subnet
| variable     | default value |
|:-------------|:------------- |
| cidrs[]*     |               |
| rds_ip_map*  | `false`       |
| name_prefix* |               |

#### subnet.sprint0_rds2_subnet
| variable     | default value |
|:-------------|:------------- |
| cidrs[]*     |               |
| rds_ip_map*  | `false`       |
| name_prefix* |               |

#### nat_gateway.sprint0-nat
| variable     | default value |
|:-------------|:------------- |
| name_prefix* |               |

#### db_subnet_group.sprint0_rds_subnetgroup
| variable     | default value |
|:-------------|:------------- |
| name_prefix* |               |