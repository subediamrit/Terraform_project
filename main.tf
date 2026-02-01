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

}