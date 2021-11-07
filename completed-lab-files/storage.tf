#create random pet name
resource "random_pet" "ptname" {
  length    = 5
  separator = "-"
}

#create s3 bucket
resource "aws_s3_bucket" "sample" {
  bucket = random_pet.ptname.id
  acl    = "public-read"
  //region = var.aws_region  
}
