provider "aws" {
    profile = "produser"
}

resource "aws_instance" "demo" {
  ami = "ami-05552d2dcf89c9b24"
  instance_type = var.instancetype
}