variable "cidr_block" {
    description = "cidr block for vpc"
    type = string
    default = "10.0.0.0/16"
}


variable "name_prefix" {
    description = "the name prefix"
    type =string
    default = "subnet"
}

variable "availability_zone" {
    description = "the availability zone"
    type =list(string)
    default = ["ap-south-2a","ap-south-2b"]
}

variable "public_cidr" {
    description = "the public subnet"
    type = list(string)
    default = ["10.0.1.0/24","10.0.2.0/24"]
}

variable "web_tier" {
    description = "the web_tier subnet"
    type = list(string)
    default = ["10.0.3.0/24","10.0.4.0/24"]
}

variable "app_tier" {
    description = "the app_tier subnet"
    type = list(string)
    default = ["10.0.5.0/24","10.0.6.0/24"]
}

variable "data_tier" {
    description = "the data_tier subnet"
    type = list(string)
    default = ["10.0.7.0/24","10.0.8.0/24"]
}

variable "enable_gateway" {
    description = "The number of eip for gateway"
    type = bool
    default = true
}

variable "route_cidr" {
    description = "The CIDR for the route_table"
    type = string
    default = "0.0.0.0/0"
}