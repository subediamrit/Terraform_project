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


output "app_tier"{
    value = module.vpc.app_tier
}

output "data_tier"{
    value = module.vpc.data_tier
}

output "security_group_id" {
    value = module.security_grp.rds_security_group
}

output "db_secret_arn" {
    value = module.secrets.db_secret_arn
}


output "db_name" {
    value = module.secrets.db_name
    sensitive = true
}


output "db_username" {
    value = module.secrets.db_username
    sensitive = true
}


output "db_password" {
    value = module.secrets.db_password
    sensitive = true 
}


output "subnet_id" {
    value = module.vpc.subnet_id
}



output "app_tier_security_grp" {
    value = module.security_grp.app_tier_security_grp
}


output "web_tier_security_grp" {
    value = module.security_grp.web_tier_security_grp
}
