output "web_dns" {
  value = var.enable_ec2 == 1 ? "http://${module.ec2[0].ec2publicdns}" : null
}

output "vpc_gp_id" {
  value = var.enable_security_groups == 1 ? module.security_groups[0].vpc_gp_id : null
}

output "publicip" {
  value = aws_instance.my-ec2-vm.*.public_ip
}