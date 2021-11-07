resource "aws_db_instance" "db1" {
  count               = 0
  allocated_storage   = 5
  engine              = "mysql"
  instance_class      = "db.t2.micro"
  name                = "webdb"
  username            = var.db_username
  password            = var.db_password
  skip_final_snapshot = true
}