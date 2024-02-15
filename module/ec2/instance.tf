variable "ami" {}
variable "instance_type" {}
variable "subnet_id" {}
variable "vpc_security_group_ids" {}
variable "vpc_id" {}

resource "aws_instance" "demo" {
 ami                    = var.ami
 instance_type          = var.instance_type
 subnet_id              = var.subnet_id
 vpc_security_group_ids = [ var.vpc_security_group_ids ]

 tags = {
    Name = "demo"
 }
}