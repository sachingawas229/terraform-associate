resource "aws_instance" "my-ec2-vm-count" {
  count         = 0
  ami           = "ami-02e136e904f3da870" # Amazon Linux in us-east-1, update as per your region
  instance_type = "t2.micro"
  tags = { Name : "EC2Demo - ${count.index}",
    createdBy : "AWS Inform",
    Zone = "us-east-1a"
  }
}