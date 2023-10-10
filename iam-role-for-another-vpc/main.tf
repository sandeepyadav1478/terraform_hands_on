# Create 2 VPC

# module "vpc_A" {
#   source = "terraform-aws-modules/vpc/aws"
#   version = "5.1.1"

#   name="vpc_A"
#   cidr = "10.0.0.0/16"

#   azs = [ "ap-south-1a", "ap-south-1b" ]
#   private_subnets = [ "10.0.1.0/24", "10.0.2.0/24" ]
#   public_subnets = [ "10.0.101.0/24", "10.0.102.0/24" ]

#   create_igw = true

#   tags = {
#     terraform = "true"
#     Environment = "dev"
#   }

# }

# module "vpc_B" {
#   source = "terraform-aws-modules/vpc/aws"
#   version = "5.1.1"

#   name="vpc_B"
#   cidr = "10.1.0.0/16"

#   azs = [ "ap-south-1a", "ap-south-1b" ]
#   private_subnets = [ "10.1.1.0/24", "10.1.2.0/24" ]
#   public_subnets = [ "10.1.101.0/24", "10.1.102.0/24" ]

#   create_igw = true

#   tags = {
#     terraform = "true"
#     Environment = "dev"
#   }
# }

module "vpc" {
  source = "./vpc"
  vpc_id = module.vpc.vpc_id
}

module "sg_for_ec2" {
  source      = "./security_group"
  vpc_id      = module.vpc.vpc_id
}


# module "ec2-instances" {
# source  = "terraform-aws-modules/ec2-instance/aws"
# version = "5.3.1"
# 
# name = "single-instance"
# instance_type = var.instance-type
# vpc_security_group_ids = [ module.A-vpc ]
# }
