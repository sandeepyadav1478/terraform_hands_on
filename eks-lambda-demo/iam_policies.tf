resource "aws_iam_policy" "lambda_invoker_policy" {
  provider = aws.prod
  name   = "lambda-invoker-policy"
  policy = file("iam_policy.json")
}
