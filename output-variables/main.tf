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

    tags = {
      Name = "sg_name_http"
    }
    
}

output "sg_name" {
  value = aws_security_group.http_access.name
}