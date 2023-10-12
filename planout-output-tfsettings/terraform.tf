terraform {
  required_version = "~> 1.6.1"
  required_providers {
    aws = {
        version = "~> 5.20.1"
    }
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0.2"
    }
  }
}