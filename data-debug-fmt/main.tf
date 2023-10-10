resource "aws_instance" "ubnutu-server" {
  ami  = data.aws_ami.ubuntu.id
  instance_type = "t2.micro"
}

resource "aws_instance" "al-server" {
  ami  = data.aws_ami.al2023.id
  instance_type = "t2.micro"
}
