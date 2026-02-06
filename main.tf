module "vpc" {
    source = "./vpc"

}

module "security_grp" {
    source = "./security_grp"
    vpc_id = module.vpc.vpc_id

}

module "external_loadbalancer" {
    source = "./external_loadbalancer"
    sg_external_lb = module.security_grp.external_loadbalancer_sg
    subnet_external_alb= module.vpc.public_subnet
    environment= "dev"
    vpc_id = module.vpc.vpc_id
}

module "internal_loadbalancer" {
    source = "./internal_loadbalancer"
    sg_internal_lb = module.security_grp.internal_loadbalancer_sg
    subnet_internal_lb= module.vpc.web_tier
    environment= "dev"
    vpc_id = module.vpc.vpc_id
}

module "rds"{
    source = "./rds"
    data_subnet_ids = module.vpc.data_tier
    security_group_id = module.security_grp.rds_security_group
    db_name = module.secrets.db_name
    db_username = module.secrets.db_username
    db_password = module.secrets.db_password

}

module "secrets" {
    source = "./secrets"
}

module "Iam" {
    source = "./Iam"
    

}

module "ec2" {
    source = "./ec2"
    web_tier_subnet = module.vpc.web_tier
    web_tier_security_grp = module.security_grp.web_tier_security_grp
    app_tier_subnet = module.vpc.app_tier
    app_tier_security_grp =  module.security_grp.app_tier_security_grp
}
