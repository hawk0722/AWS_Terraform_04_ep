# Create Interface Endpoint
resource "aws_vpc_endpoint" "iep" {
  for_each = toset(var.iep)

  vpc_id              = var.vpc_id
  service_name        = "com.amazonaws.${var.region}.${each.value}"
  vpc_endpoint_type   = "Interface"
  private_dns_enabled = true

  subnet_ids         = [var.public_subnet_1c_id]
  security_group_ids = [var.sg_iep_id]

  tags = {
    Name = "${var.project}-${var.env}-iep-${each.value}"
  }
}

# Create Gateway Endpoint
resource "aws_vpc_endpoint" "gwep" {
  vpc_id            = var.vpc_id
  service_name      = "com.amazonaws.${var.region}.s3"
  vpc_endpoint_type = "Gateway"

  tags = {
    Name = "${var.project}-${var.env}-gwep"
  }
}

# Route table for private - Gateway Endpoint
resource "aws_vpc_endpoint_route_table_association" "private_rtb_gwep" {
  route_table_id  = var.private_rtb_id
  vpc_endpoint_id = aws_vpc_endpoint.gwep.id
}
