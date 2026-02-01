variable "sg_external_lb" {
    description = "name of slb security group"
    type = string
}

variable "subnet_external_alb" {
    description = "name of the subnet" 
    type = list(string)
}

variable "internal" {
    description = "internal in boolean"
    type = bool
    default = false
}

variable "environment" {
    description = "working environment"
    type = string
}

variable "target_port" {
    description = "name of the target port"
    type = number
    default = 3000
}

variable "vpc_id" {
    description = "value of the vpc_id"
    type = string
}

