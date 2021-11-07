output "instance_id" {
  value = aws_instance.my-ec2-vm.id
}

output "ec2publicdns" {
  value = aws_instance.my-ec2-vm.public_ip
}