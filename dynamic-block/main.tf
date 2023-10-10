resource "aws_instance" "example" {
    provider = aws.prod
    ami = "ami-05552d2dcf89c9b24"
    instance_type = "t2.micro"
}

resource "aws_security_group" "all_80_443_22" {
  provider = aws.prod
  name        = "allow ssh+tls"
  description = "all tls inbound ops in vpc"

  dynamic "ingress" {
    for_each = var.sg_rules_ingress
    iterator = rule

    content {
      description = rule.value["description"]
      from_port   = rule.value["from_port"]
      to_port     = rule.value["to_port"]
      protocol    = "tcp"
      cidr_blocks = rule.value["cidr_blocks"]
      ipv6_cidr_blocks = ["::/0"]
    }
  }

  dynamic "egress" {
    for_each = var.sg_rules_egress
    iterator = rule

    content {
      description = rule.value["description"]
      from_port   = rule.value["from_port"]
      to_port     = rule.value["to_port"]
      protocol    = "tcp"
      cidr_blocks = rule.value["cidr_blocks"]
      ipv6_cidr_blocks = ["::/0"]
    }
  }

  tags = {
    Name = "all_80_443_22"
  }
  
  # incase when security group deletion got stuck, to hard stop
  timeouts {
    delete = "2m"
  }

  lifecycle {
    # to tolerate bi-directional dependencies problem
    create_before_destroy = true
    
    # re-create resource when this sg updates
    replace_triggered_by = [ aws_instance.example ]
  }

}