import {
  to = aws_instance.example
  id = "i-024bd1aa32dc34ae5"
}

import {
  to = aws_instance.example1
  id = "i-0a7d444d599d4fed0"
}

resource "aws_iam_user" "iamusers" {
  provider = aws.prod
  name     = "tfdemo.${count.index}"
  path     = "/sysops/"
  count    = 3
}

resource "aws_instance" "example" {
  provider      = aws.prod
  ami           = "ami-05552d2dcf89c9b24"
  instance_type = "t2.micro"

  tags = {
    Name = "example_instance"
  }
}

resource "aws_instance" "example1" {
  provider      = aws.prod
  ami           = "ami-0c42696027a8ede58"
  instance_type = "t2.micro"

  tags = {
    Name = "example_instance2"
  }
}