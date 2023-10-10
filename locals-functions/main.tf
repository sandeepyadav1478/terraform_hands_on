locals {
  created_at = formatdate("EEE, DD-MMM-YYYY hh:mm:ss ZZZ",timestamp())
}

# resource "aws_key_pair" "ssh-pair" {
#   key_name = "tf-ssh-key"
#   public_key = file("${path.module}/tf-ec2-kp.pem")
#   tags = {
#     created_at = local.created_at
#    }
# }

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

resource "aws_instance" "demo-app" {
  ami = lookup(var.ami_id, var.region)
  instance_type = "t2.micro"
  key_name = "tf-ec2-kp"
  security_groups = ["${aws_security_group.http_access.name}"]
  count = 2

  tags = {
    Name = element(var.instance_names, count.index)
    created_at = local.created_at
  }
}