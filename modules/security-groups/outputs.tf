output "vpc_gp_id" {
  value = aws_security_group.vpc-web.id
}

output "vpc_ssh_id" {
  value = aws_security_group.vpc-ssh.id
}