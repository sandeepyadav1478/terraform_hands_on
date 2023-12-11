resource "aws_iam_user" "lb" {
  name = var.user_names[count.index]
  count = 3
  path = "/developer/"
}