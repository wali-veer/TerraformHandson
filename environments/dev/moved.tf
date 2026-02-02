#moved {
#    from    = module.web_vpc   
#    to      = module.dev.module.web_vpc   
#}

#moved {
#    from    = module.web_autoscaling   
#    to      = module.dev.module.web_autoscaling   
#}

#moved {
#    from    = module.web_alb   
#    to      = module.dev.module.web_alb   
#}

#moved {
#    from    = module.web_sg   
#    to      = module.dev.module.web_sg   
#}

#moved {
#    from    = module.web_alb.target_group_arns   
#    to      = module.dev.module.module.web_alb.target_group_arns   
#    #https://registry.terraform.io/modules/terraform-aws-modules/autoscaling/aws/latest?tab=outputs
#}


