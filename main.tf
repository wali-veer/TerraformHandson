data "aws_ami" "app_ami" {

  most_recent = true

  filter {
    name    = "name"
    values  = ["bitnami-tomcat-*-x86_64-hvm-ebs-nami"]
  }

  filter {
    name    = "virtualization-type"
    values  = ["hvm"]
  }

  owners = ["123412341234"]
}

data "aws_vpc" "default" {
  default = true
}


resource "aws_instance" "web" {

  ami                     = data.aws_ami.app_ami.id 
  instance_type           = var.instance_type
  vpc_security_group_ids  = [module.web_sg.vpc_security_group_id]

  tags = {
    name  = "Instance creted through module"
  }

}


module "web_sg" {
  source              = "terraform-aws-modules/security-group/aws"
  version             = "4.13.0"

  vpc_id              = data.aws_vpc.default.id
  name                = "web"

  ingress_rule        = ["https-443-tcp","http-80-tcp"]
  ingress_cidr_blocks = ["0.0.0.0/0"]
  
  egress_rules        = ["all_all"]
  egress_cidr_blocks  = ["0.0.0.0/0"]
}
