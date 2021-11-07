resource "aws_s3_bucket" "mys3bucket" {

  # for_each Meta-Argument
  for_each = {
    dev  = "nat-devpp-bucket"
    qa   = "nat-qapp-bucket"
    stag = "nat-sapp-bucket"
    prod = "nat-papp-bucket"
  }

  bucket = "${each.key}-${each.value}"
  acl    = "private"

  tags = {
    Environment = each.key
    bucketname  = "${each.key}-${each.value}"
    eachvalue   = each.value
  }
}