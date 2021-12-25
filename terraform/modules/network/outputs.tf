output "vpc_id" {
  value = aws_vpc.vpc.id
}

output "subnet_id" {
  value = aws_subnet.primary.id
}

output "subnet_cidr" {
  value = aws_subnet.primary.cidr_block
}
