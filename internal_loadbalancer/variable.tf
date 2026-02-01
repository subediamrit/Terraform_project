variable "sg_internal_lb" {
    description = "name of slb security group"
    type = string
}

variable "subnet_internal_lb" {
    description = "name of the subnet" 
    type = list(string)
}

variable "internal" {
    description = "internal in boolean"
    type = bool
    default = true
}

variable "environment" {
    description = "working environment"
    type = string
}

variable "target_port" {
    description = "name of the target port"
    type = number
    default = 5000
}

variable "vpc_id" {
    description = "value of the vpc_id"
    type = string
}

