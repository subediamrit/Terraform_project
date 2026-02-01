output "vpc_id" {
    value = module.vpc.vpc_id
}

output "external_loadbalancer_sg"{
    value = module.security_grp.external_loadbalancer_sg
}


output "internal_loadbalancer_sg"{
    value = module.security_grp.internal_loadbalancer_sg
}


output "public_subnet" {
    value = module.vpc.public_subnet
}

output "web_tier"{
    value = module.vpc.web_tier
}


output "data_tier"{
    value = module.vpc.data_tier
}

output "security_group_id" {
    value = module.security_grp.rds_security_group
}