module "network" {
  source = "./modules/network"

  project        = "acklen"
  environment    = "production"
  version_string = "v0.0.1"
  cidr_block     = "10.0.0.0/16"

  natgateway_mapping = [
    {
      public_subnet = "public-network-1",
      private_subnets = [
        "private-network-1",
        "private-network-2"
      ]
    }
  ]

  public_subnets = [
    {
      name              = "public-network-1"
      availability_zone = "us-east-1a",
      cidr_block        = "10.0.0.0/24"
    },
    {
      name              = "public-network-2"
      availability_zone = "us-east-1b",
      cidr_block        = "10.0.1.0/24"
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
      cidr_block        = "10.0.3.0/24"
    },
    {
      name              = "db-network-1"
      availability_zone = "us-east-1a",
      cidr_block        = "10.0.4.0/24"
    },
    {
      name              = "db-network-2"
      availability_zone = "us-east-1b",
      cidr_block        = "10.0.5.0/24"
    }
  ]

  security_groups = [
    {
      name        = "public"
      description = "Allow connectivity from internet"
      ingress = [
        {
          from_port      = 22
          to_port        = 22
          protocol       = "tcp"
          cidr_blocks    = ["0.0.0.0/0"]
          security_group = null
        },
        {
          from_port      = 8500
          to_port        = 8500
          protocol       = "tcp"
          cidr_blocks    = ["0.0.0.0/0"]
          security_group = null
        },
        {
          from_port      = 8300
          to_port        = 8300
          protocol       = "tcp"
          cidr_blocks    = []
          security_group = "loadbalancer"
        },
        {
          from_port      = 8302
          to_port        = 8302
          protocol       = "tcp"
          cidr_blocks    = []
          security_group = "loadbalancer"
        },
        {
          from_port      = 8302
          to_port        = 8302
          protocol       = "udp"
          cidr_blocks    = []
          security_group = "loadbalancer"
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
      name        = "private"
      description = "Allow SSH from bastion and load balancer communication"
      ingress = [
        {
          from_port      = 22
          to_port        = 22
          protocol       = "tcp"
          cidr_blocks    = []
          security_group = "public"
        },
        {
          from_port      = 8500
          to_port        = 8500
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
    {
      name        = "consul"
      description = "Allow SSH from bastion and load balancer communication"
      ingress = [
        {
          from_port      = 8300
          to_port        = 8301
          protocol       = "tcp"
          cidr_blocks    = []
          security_group = "consul"
        },
        {
          from_port      = 8301
          to_port        = 8301
          protocol       = "udp"
          cidr_blocks    = []
          security_group = "consul"
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
    }
  ]
}
