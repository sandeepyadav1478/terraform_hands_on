# Create a EC2 Instance
module "ec2" {
  source = "terraform-aws-modules/ec2-instance/aws"
  name = "my-ec2"
  instance_count = 1
  ami = "ami-0c94855ba95c574c8"
  instance_type = "t2.micro"
  subnet_id = module.vpc.private_subnets[0]
#   key_name = "my-key-pair"
}