# Configure the AWS Provider

provider "aws" {
    region = var.AWS_REGION
    default_tags {
        tags = {
            terraform = "true"
            hashicorp-learn = "module-use"
            needs = "access ec2 from another vpc"

    }
  }
}