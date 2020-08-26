data "aws_route53_zone" "zone" {
  name         = "${var.domain}."
  private_zone = false
}

# data "aws_ami" "latest_ubuntu" {
#   most_recent = true
#   owners = ["099720109477"] 
# }

data "aws_acm_certificate" "certificate" {
  domain   = "*.${var.domain}"
  statuses = ["ISSUED"]
}