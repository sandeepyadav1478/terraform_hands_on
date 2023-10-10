variable "instance_type" {
  description = "provides instance type"
  type = list(string)
  default = [ "r7g.metal", "m5.large", "c5.metal" ]
}

variable "region_selection" {
  description = "Region available, for high availbility"
  type = map
  default = {
    dev: "eu-central-1"
    test: "ap-southeast-1"
    prod: "us-east-1"
  }
}