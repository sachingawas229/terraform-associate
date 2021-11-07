terraform {
  #required terraform version
  required_version = "~> 1.0.0"
  #required provider and their versions
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "> 3"
    }

    random = {
      source  = "hashicorp/random"
      version = "> 3.0.0"
    }
  }
  #remote backend for storing terraform satte in S3 bucket
  backend "s3" {
    bucket = "ecs-us-east-1-terraform-state"
    key    = "statecommands/terraform.tfstate"
    region = "us-east-1"

    # Enable during Step-09     
    # For State Locking
    dynamodb_table = "terraform-dev-state-table"
  }

}


# Deafult Provider Block
provider "aws" {
  region  = var.aws_region
  profile = "default"
}


# Provider Block 2
provider "aws" {
  region  = "us-west-1"
  profile = "default"
  alias   = "aws-west-1"
}
