variable "aws_region" {
  default = "us-east-1"
}

variable "ami_id" {
  validation {
    condition     = length(var.ami_id) > 8 && substr(var.ami_id, 0, 4) == "ami-"
    error_message = "The AMI ID must be valid AMI DI starting with ami-."
  }
}

variable "deploy_vpc" {}

variable "enable_security_groups" {}

variable "enable_ec2" {}

/*variable "ec2_instance_type" {
  type = list(string)
  default = [ "t3.small", "t2.micro","t3.large" ]
}*/

variable "tags" {
  type = map(string)
  default = {
    "description" = "Webserver for app"
  }

}


variable "ec2_instance_type" {
  type = map(string)
  default = {
    "small" = "t3.small"
    "micro" = "t2.micro"
    "large" = "t3.large"
  }
}

variable "db_username" {
  description = "RDS Username"
  type        = string
  sensitive   = true
}

variable "db_password" {
  description = "RDS Password"
  sensitive   = true
}