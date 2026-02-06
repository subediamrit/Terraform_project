output "external_loadbalancer_sg"{
    value = aws_security_group.external_load_balancer.id
}

output "internal_loadbalancer_sg"{
    value = aws_security_group.internal_load_balancer.id
}


output "rds_security_group"{
    value = aws_security_group.rds.id
}

output "bastion" {
    value = aws_security_group.bastion.id
}

output "web_tier_security_grp" {
    value = aws_security_group.frontend.id
}

output "app_tier_security_grp" {
    value = aws_security_group.backend.id
}

