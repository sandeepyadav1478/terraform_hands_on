variable "sg_rules_ingress" {
  description = "dynamic rules for ingress"
  type = list(object({
    description = string
    from_port   = number
    to_port     = number
    cidr_blocks = list(string)
  }))
  default = [{
    description = "ssh"
    from_port   = 22
    to_port     = 22
    cidr_blocks = ["0.0.0.0/0"]
  }]
}

variable "sg_rules_egress" {
  description = "dynamic rules for egress"
  type = list(object({
    description = string
    from_port   = number
    to_port     = number
    cidr_blocks = list(string)
  }))
  default = [{
    description = "ssh"
    from_port   = 22
    to_port     = 22
    cidr_blocks = ["0.0.0.0/0"]
  }]
}