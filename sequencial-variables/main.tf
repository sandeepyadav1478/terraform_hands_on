provider "aws" {
    profile = "terraform"
    region = var.region_selection["dev"]
}

resource "aws_instance" "example" {
  ami = "ami-05552d2dcf89c9b24"
  instance_type = var.instance_type["${count.index}"]
  count = 1

  tags = {
    Name = "instance-${var.instance_type["${count.index}"]}"
  }
}
