resource "aws_iam_user" "my-user" {
  for_each = toset(["TJack", "TJames", "TMadhu", "TDave"])
  name     = each.key

  tags = {
    createdBy = "terraform"
  }
}