module "network" {
  source = "./modules/network"

  project                = "acklen"
  environment            = "prod"
  cidr_block             = "10.0.0.0/16"
  natgateway_subnet_name = "public-network-1"

  public_subnets = [
    {
      name              = "public-network-1"
      availability_zone = "us-east-1a",
      cidr_block        = "10.0.0.0/24",
    },
    {
      name              = "public-network-2"
      availability_zone = "us-east-1b",
      cidr_block        = "10.0.1.0/24",
    }
  ]

  private_subnets = [
    {
      name              = "private-network-1"
      availability_zone = "us-east-1a",
      cidr_block        = "10.0.2.0/24"
    },
    {
      name              = "private-network-2"
      availability_zone = "us-east-1b",
      cidr_block        = "10.0.3.0/24",
    },
    {
      name              = "db-network-1"
      availability_zone = "us-east-1a",
      cidr_block        = "10.0.4.0/24",
    },
    {
      name              = "db-network-2"
      availability_zone = "us-east-1b",
      cidr_block        = "10.0.5.0/24",
    }
  ]

  security_groups = [
    {
      name        = "bastion"
      description = "Allow SSH from the open internet"
      ingress = [
        {
          from_port      = 22
          to_port        = 22
          protocol       = "tcp"
          cidr_blocks    = ["0.0.0.0/0"]
          security_group = null
        },
        {
          from_port      = 3306
          to_port        = 3306
          protocol       = "tcp"
          cidr_blocks    = ["0.0.0.0/0"]
          security_group = null
        },
      ]
      egress = [
        {
          from_port      = 0
          to_port        = 0
          protocol       = "-1"
          cidr_blocks    = ["0.0.0.0/0"]
          security_group = null
        }
      ]
    },
    {
      name        = "loadbalancer"
      description = "Default HTTPS load balancer ports"
      ingress = [
        {
          from_port      = 80
          to_port        = 80
          protocol       = "tcp"
          cidr_blocks    = ["0.0.0.0/0"]
          security_group = null
        },
        {
          from_port      = 443
          to_port        = 443
          protocol       = "tcp"
          cidr_blocks    = ["0.0.0.0/0"]
          security_group = null
        }
      ]
      egress = [
        {
          from_port      = 0
          to_port        = 0
          protocol       = "-1"
          cidr_blocks    = ["0.0.0.0/0"]
          security_group = null
        }
      ]
    },
    {
      name        = "database"
      description = "Allow MYSQL ports to Wordpress private subnets and database network"
      ingress = [
        {
          from_port      = 3306
          to_port        = 3306
          protocol       = "tcp"
          cidr_blocks    = [],
          security_group = "bastion"
        },
        {
          from_port      = 3306
          to_port        = 3306
          protocol       = "tcp"
          cidr_blocks    = [],
          security_group = "private"
        },
        {
          from_port      = 11211
          to_port        = 11211
          protocol       = "tcp"
          cidr_blocks    = [],
          security_group = "memcached"
        }
      ]
      egress = [
        {
          from_port      = 0
          to_port        = 0
          protocol       = "-1"
          cidr_blocks    = ["0.0.0.0/0"]
          security_group = null
        }
      ]
    },
    {
      name        = "private"
      description = "Allow SSH from bastion and load balancer communication"
      ingress = [
        {
          from_port      = 22
          to_port        = 22
          protocol       = "tcp"
          cidr_blocks    = []
          security_group = "bastion"
        },
        {
          from_port      = 80
          to_port        = 80
          protocol       = "tcp"
          cidr_blocks    = []
          security_group = "loadbalancer"
        },
      ]
      egress = [
        {
          from_port      = 0
          to_port        = 0
          protocol       = "-1"
          cidr_blocks    = ["0.0.0.0/0"]
          security_group = null
        }
      ]
    },
  ]
}
