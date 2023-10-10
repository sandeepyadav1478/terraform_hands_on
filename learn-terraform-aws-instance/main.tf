terraform {
  cloud {
    organization = "sandeepyadav1478-org"
    workspaces {
      name = "learn-tfs-aws"
    }
  }
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.16.1"
    }
  }

  required_version = ">= 1.5.7"
}

provider "aws" {
  region = "ap-south-1"
  alias  = "primary_region"
}

resource "aws_instance" "app_server" {
  provider      = aws.primary_region
  ami           = "ami-02bb7d8191b50f4bb"
  instance_type = "t2.micro"

  tags = {
    Name = "ExampleAppServerInstance"
  }
}
