provider "aws" {
  region = "ap-south-1"
  profile = "produser"
}

resource "aws_security_group" "http_access" {
    name = "allow_http"
    description = "allow http from port 80"
    
    ingress {
        description = "http from vpc"
        from_port = "80"
        to_port = "80"
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    ingress {
        description = "ssh from anywhere"
        from_port = "22"
        to_port = "22"
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    
    egress {
        from_port        = 0
        to_port          = 0
        protocol         = "-1"
        cidr_blocks      = ["0.0.0.0/0"]
        ipv6_cidr_blocks = ["::/0"]
    }
    
    tags = {
      Name = "allow_http"
    }
}

resource "aws_instance" "check_80" {
    ami = "ami-05552d2dcf89c9b24"
    instance_type = "t2.micro"
    security_groups = [ "${aws_security_group.http_access.name}" ]

    user_data = "${file("ec2-user-data.sh")}"

    tags = {
      Name = "check_80"
    }
}

output "instance_public_ip" {
  value = aws_instance.check_80.public_ip
}