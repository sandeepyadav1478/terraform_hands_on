sg_rules_ingress = [{
  description = "ssh"
  from_port   = 22
  to_port     = 22
  cidr_blocks = ["0.0.0.0/0"]
  }, {
  description = "http"
  from_port   = 80
  to_port     = 80
  cidr_blocks = ["0.0.0.0/0"]
  }, {
  description = "https"
  from_port   = 443
  to_port     = 443
  cidr_blocks = ["0.0.0.0/0"]
}]

sg_rules_egress = [{
  description = "tcp"
  from_port   = 0
  to_port     = 0
  cidr_blocks = ["0.0.0.0/0"]
  }, {
  description = "tcp"
  from_port   = 0
  to_port     = 0
  cidr_blocks = ["0.0.0.0/0"]
  }, {
  description = "ssh"
  from_port   = 22
  to_port     = 22
  cidr_blocks = ["0.0.0.0/0"]
}]