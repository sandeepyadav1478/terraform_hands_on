resource "aws_instance" "example_ec2" {
  provider = aws.terraform
  ami = "ami-05552d2dcf89c9b24"
  instance_type = var.instance_type

  tags = {
    Name = "example_ec2"
  }
}