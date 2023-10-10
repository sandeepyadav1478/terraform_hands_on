provider "aws" {
    alias = "devgroup"
    profile = "devuser"
    region = "ap-south-1"
}

provider "aws" {
    alias = "prodgroup"
    profile = "produser"
    region = "ap-south-1"
}

# resource "aws_instance" "n1" {
#     provider = aws.devgroup
#     ami = "ami-05552d2dcf89c9b24"
#     name = "n1"
#     instance_type = "t2.micro" 
#     tags = {
#         profile = "devuser"
#     }
# }

resource "aws_instance" "n2" {
    provider = aws.prodgroup
    ami = "ami-0899663faf239dd8a"
    instance_type = "t2.micro"
    tags = {
      profile = "produser"
      Name = "n2"
    }
}