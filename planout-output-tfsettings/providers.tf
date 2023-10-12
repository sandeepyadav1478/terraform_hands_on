provider "aws" {
  profile = "terraform"
  alias = "prod"
}

provider "docker" {
  host = "unix:///var/run/docker.sock"
}