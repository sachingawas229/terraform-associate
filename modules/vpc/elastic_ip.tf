# Resource-9: Create Elastic IP
resource "aws_eip" "my-eip" {
  count = var.enable_ec2
  instance = var.instance_id
  vpc      = true
  # Meta-Argument
  depends_on = [aws_internet_gateway.vpc-dev-igw]
}
