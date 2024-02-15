provider "aws" {
  region = "ap-south-1"
}


module "vpc" {
 source  = "./module/vpc"
 vpc_cidr_block     = var.vpc_cidr_block
 project            = var.project
 public_cidr_block  = var.public_cidr_block
 private_cidr_block = var.private_cidr_block
 from_port          = var.from_port
 to_port            = var.to_port
}


module "ec2" {
 source  = "./module/ec2"
 ami     = "ami-0449c34f967dbf18a"
 instance_type = "t2.micro"
 subnet_id  = module.vpc.subnet_id
 vpc_security_group_ids = module.vpc.vpc_security_group_ids
 vpc_id = module.vpc.vpc_id
}
