data "aws_caller_identity" "current" {}

locals {
    account_id = data.aws_caller_identity.current.account_id
}

resource "aws_iam_role" "eks_pod_invoker_role" {
  provider = aws.prod
  name               = "EKSPodInvokerRole"
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect    = "Allow"
        Principal = {
          Federated = "arn:aws:iam::${local.account_id}:oidc-provider/oidc.eks.${var.aws_region}.amazonaws.com/id/${module.eks_cluster.cluster_oidc_issuer}"
        }
        Action = "sts:AssumeRoleWithWebIdentity"
        Condition = {
          StringEquals = {
            "oidc.eks.${var.aws_region}.amazonaws.com/id/${module.eks_cluster.cluster_oidc_issuer}:sub" = "system:serviceaccount:<namespace>:<service-account-name>"
          }
        }
      }
    ]
  })
}