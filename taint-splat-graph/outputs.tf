output "iamarns" {
  value = aws_iam_user.iamusers[*].arn
}