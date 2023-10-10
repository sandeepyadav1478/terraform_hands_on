# data "archive_file" "lambda_function_code" {
#   type        = "zip"
#   source_file = "lambda_function.js"
#   output_path = "lambda_function_payload.zip"
# }

# resource "aws_lambda_function" "example" {
#   function_name = "example-lambda-function"
#   handler       = "index.handler"
#   runtime       = "nodejs14.x"
#   role          = aws_iam_role.eks_pod_invoker_role.arn
#   filename      = "lambda_function_payload.zip"

#   source_code_hash = filebase64sha256("lambda_function_payload.zip")
# }

# resource "aws_iam_policy" "lambda_invoker_policy" {
#   name   = "lambda-invoker-policy"
#   policy = file("iam_policy.json")
# }

# resource "aws_iam_role" "eks_pod_invoker_role" {
#   name               = "EKSPodInvokerRole"
#   assume_role_policy = file("assume_role_policy.json")
# }

# resource "aws_iam_role_policy_attachment" "lambda_invoker_attachment" {
#   role       = aws_iam_role.eks_pod_invoker_role.name
#   policy_arn = aws_iam_policy.lambda_invoker_policy.arn
# }

# module "eks_cluster" {
#   source       = "terraform-aws-modules/eks/aws"
#   version      = "17.10.0"
#   cluster_name = "example-eks-cluster"
#   subnets      = ["subnet-xxxxxx", "subnet-yyyyyy"]  # Replace with your subnet IDs
#   vpc_id       = "vpc-xxxxxx"  # Replace with your VPC ID

#   workers_desired_capacity = 2
#   workers_max_capacity     = 4
#   workers_min_capacity     = 1

#   tags = {
#     Environment = "test"
#   }

#   eks_worker_role_arn = aws_iam_role.eks_pod_invoker_role.arn
# }

# resource "kubectl_manifest" "lambda_invoker_deployment" {
#   yaml_body = file("k8s_deployment.yaml")
# }


#------------------

# # Create an EKS cluster
# resource "aws_eks_cluster" "default" {
#   provider = aws.prod
#   name = "my-eks-cluster"
#   kubernetes_network_version = 1.21
#   role_arn = aws_iam_role.eks_cluster_role.arn
# }

# # Create a Lambda function
# resource "aws_lambda_function" "default" {
#   provider = aws.prod
#   function_name = "my-lambda-function"
#   runtime = "python3.8"
#   handler = "index.handler"
#   role = aws_iam_role.lambda_function_role.arn
#   timeout = 60

#   source_code_hash = filebase64sha256("lambda_function.py")
# }

# # Grant the Lambda function permission to invoke the Kubernetes API
# resource "aws_iam_role_policy_attachment" "default" {
#   provider = aws.prod
#   role = aws_iam_role.lambda_function_role.name
#   policy_arn = aws_iam_policy.kubernetes_api_access.arn
# }

# # Create a Kubernetes event source mapping to invoke the Lambda function
# resource "aws_lambda_event_source_mapping" "default" {
#   provider = aws.prod
#   event_source_arn = "arn:aws:events:us-east-1:123456789012:rule/my-rule"
#   function_name = aws_lambda_function.default.function_name
# }
