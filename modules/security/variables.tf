#security_group.sprint0_bastion_sg
variable "name_prefix" {}
variable "vpc_id" {}
variable "allowed_ssh_ip" {}
variable "bastion_egress_cidr" { default = ["0.0.0.0/0"] }
#security_group.sprint0_public_sg
variable "public_sg_ingress" {
  type = list(
    object({
      from_port   = number
      to_port     = number
      protocol    = string
      cidr_blocks = list(string)
    })
  )
  default = [
    {
      from_port   = 80
      to_port     = 80
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    },
    {
      from_port   = 443
      to_port     = 443
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  ]
}
variable "public_egress_cidr" { default = ["0.0.0.0/0"] }
#security_group.sprint0_private_sg
variable "private_ingress_cidr" {}
variable "private_egress_cidr" { default = ["0.0.0.0/0"] }
#security_group.sprint0_rds_sg
variable "db_port" {}
