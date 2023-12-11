/*terraform {
  required_providers {
    aws = {
        source = "hashicorp/aws"
        version = "> 5.16.1"
    }
  }
  # required_version = ">= 1.5.7"
}*/

terraform {
  required_providers {
    aws = {
        source = "hashicorp/aws"
        version = "> 5.16.1"
    }
  }
  required_version = ">= 1.5.7"
}