variable "instance_type" {
  description = "Type of the EC2 instance we want to provision"
  default     = "t3.nano"
}

variable "ami_filter" {
  description = "Filter for AMI and its owner"

  type = object (
    {
      name  = string
      owner = string
    }
  )

  default = {
    name  = "bitnami-tomcat-*-x86_64-hvm-ebs-nami"
    owner = "123098456098" 
  }
}

variable "environment" {
  description = "Name of the environment to be created"

  type object (
    {
      name = string
      network_prefix = string      
    }
  )

  default = {
    name            = "dev"
    network_prefix  = "10.0"
  }
}

variable "asg_min" {
  description = "Minimum number of instances to be provisoned"
  default = 1
}

variable "asg_max" {
  description = "maximum number of instances to be provisoned"
  default = 5
}