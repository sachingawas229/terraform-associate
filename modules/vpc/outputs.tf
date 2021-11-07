output "vpc_id" {
  value = aws_vpc.vpc-dev.id
}

output "subnet_id" {
  value = aws_subnet.vpc-dev-public-subnet-1.id
}