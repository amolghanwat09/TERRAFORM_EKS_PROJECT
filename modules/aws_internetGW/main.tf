resource "aws_internet_gateway" "gw" {
  vpc_id = var.vpc_id

  tags = var.tags
}

output "internetGW_id" {
    value = aws_internet_gateway.gw.id  
}