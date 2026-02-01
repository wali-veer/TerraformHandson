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

module "web_vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = "dev"
  cidr = "10.0.0.0/16"

  azs             = ["us-west-1a", "us-west-1b", "us-west-1c"]
  public_subnets  = ["10.0.101.0/24", "10.0.102.0/24", "10.0.103.0/24"]

  tags = {
    Terraform = "true"
    Environment = "dev"
  }
}


resource "aws_instance" "web" {

  ami                     = data.aws_ami.app_ami.id 
  instance_type           = var.instance_type
  subnet_id               = module.web_vpc.public_subnets[0]
  vpc_security_group_ids  = [module.web_sg.security_group_id]

  tags = {
    name  = "Instance creted through module for Dev"
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