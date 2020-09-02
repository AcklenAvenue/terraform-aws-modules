module "network" {
  source   = "./network"
  name     = var.name
  vpc_cidr = var.vpc_cidr

  cidrs = {
    public1  = "10.0.1.0/24"
    public2  = "10.0.2.0/24"
    private1 = "10.0.3.0/24"
    private2 = "10.0.4.0/24"
    rds1     = "10.0.5.0/24"
    rds2     = "10.0.6.0/24"
  }
}

resource "aws_instance" "bastion" {
  instance_type               = var.instance_type
  ami                         = "ami-0bcc094591f354be2"
  key_name                    = var.key_name
  subnet_id                   = module.network.public1_subnet_id
  associate_public_ip_address = true

  vpc_security_group_ids = [
    aws_security_group.ssh.id,
    aws_security_group.consul.id
  ]

  # user_data = templatefile("${path.module}/files/init.sh", {
  #   AWS_ACCESS_KEY_ID     = var.aws_access_key_id,
  #   AWS_SECRET_ACCESS_KEY = var.aws_secret_access_key,
  #   AWS_REGION            = var.aws_region,
  #   DATACENTER            = var.name,
  #   CONSUL_CLUSTER_TAG    = "${var.name}-bastion"
  # })

  tags = {
    Name    = "${var.name}-bastion"
    Project = var.name
  }
}

resource "aws_lb_target_group_attachment" "bastion" {
  target_group_arn = aws_lb_target_group.nginx.arn
  target_id        = aws_instance.bastion.id
  port             = 80
}

resource "aws_lb_target_group_attachment" "consul" {
  target_group_arn = aws_lb_target_group.nginx.arn
  target_id        = aws_instance.bastion.id
  port             = 8500
}
