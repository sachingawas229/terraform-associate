# Resource Block
resource "aws_instance" "my-ec2-vm" {
  ami             = var.ami_id # Amazon Linux in us-east-1, update as per your region
  //instance_type   = var.ec2_instance_type[1]
  instance_type = var.ec2_instance_type["micro"]
  key_name        = "terraform-key"
  subnet_id       = var.subnet_id
  security_groups = [var.sg_id]
  user_data = file("${path.module}/apache-install.sh")
  /*user_data = <<-EOF
    #! /bin/bash
    sudo yum update -y
    sudo yum install -y httpd
    sudo service httpd start  
    sudo systemctl enable httpd
    #echo "<h1>Welcome to StackSimplify ! AWS Infra created using Terraform in us-east-1 Region</h1>" | sudo tee /var/www/html/index.html
    echo "<h1>Welcome to StackSimplify ! AWS Infra created using Terraform in us-east-1 Region</h1>" > /var/www/html/index.html
  EOF*/
  tags = merge(var.tags, {Name = "EC2 - ${terraform.workspace} - ${var.index}"})
}
 