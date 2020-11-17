resource "aws_route_table_association" "public1_assoc" {
  subnet_id      = aws_subnet.public1_subnet.id
  route_table_id = aws_route_table.public_rt.id
}

resource "aws_route_table_association" "public2_assoc" {
  subnet_id      = aws_subnet.public2_subnet.id
  route_table_id = aws_route_table.public_rt.id
}

resource "aws_route_table_association" "private1_assoc" {
  subnet_id      = aws_subnet.private1_subnet.id
  route_table_id = aws_default_route_table.private_rt.id
}

resource "aws_route_table_association" "private2_assoc" {
  subnet_id      = aws_subnet.private2_subnet.id
  route_table_id = aws_default_route_table.private_rt.id
}

resource "aws_db_subnet_group" "rds_subnetgroup" {
  name = lower("${var.name}-subnetgroup-rds")

  subnet_ids = [
    aws_subnet.rds1_subnet.id,
    aws_subnet.rds2_subnet.id
  ]

  tags = {
    Name    = "${var.name}-rds"
    Project = var.project
  }
}
