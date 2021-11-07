resource "aws_instance" "ec2-demo" {
  ami               = "ami-02e136e904f3da870" # Amazon Linux in us-east-1, update as per your region
  instance_type     = "t2.micro"
  availability_zone = "us-east-1b"
  tags              = { Name : "EC2-Lifecycle" }
  lifecycle {
    //create_before_destroy = true
    //prevent_destroy = false
    ignore_changes = [
      tags,
    ]
  }
}