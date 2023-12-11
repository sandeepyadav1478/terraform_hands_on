output "users_arn" {
  value = aws_iam_user.lb[*].arn
}

output "password" {
  value = aws_iam_user.lb[*].password
  sensitive = true
}