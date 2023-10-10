resource "aws_lambda_function" "example" {
  provider = aws.prod
  function_name = "example-lambda-function"
  handler       = "lambda_function.lambda_handler"
  runtime       = "python3.8"
  role          = aws_iam_role.eks_pod_invoker_role.arn

  // Inline Lambda function code
  inline_code = file("${path.module}/lambda_function.py")
}
