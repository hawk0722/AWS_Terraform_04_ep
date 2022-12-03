output "private_subnet_1c_id" {
  value = aws_subnet.private_subnet_1c.id
}

output "vpc_id" {
  value = aws_vpc.vpc.id
}

# Interface Endpoint
output "sg_iep_id" {
  value = aws_security_group.sg_iep.id
}

output "public_subnet_1c_id" {
  value = aws_subnet.public_subnet_1c.id
}

# Gateway Endpoint
output "private_rtb_id" {
  value = aws_route_table.private_rtb.id
}
