variable "ami_id" {
    description = "contains ami ids for specific regions"
    type = map(string)
    default = {
        ap-south-1 = "ami-067c21fb1979f0b27"
        us-east-1 = "ami-03a6eaae9938c858c"
        eu-central-1 = "ami-01342111f883d5e4e"
    }

}

variable "region" {
    description = "selected region to deploy ec2s"
    type = string
    default = "ap-south-1"
}

variable "instance_names" {
  description = "these names will be used by ec2 instances"
  type = list(string)
  default = [ "primary", "secondary" ]
}
