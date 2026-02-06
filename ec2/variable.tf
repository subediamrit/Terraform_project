variable "ami" {
    description = "ami id of the ec2"
    type = string
    default = "ami-02774d409be696d81"
}

variable "instance" {
    description = "instance size of the ec2"
    type = string
    default = "t3.micro"
}

variable "web_tier_subnet" {
    description = "security group of the ec2"
    type = list(string)
   
}

variable "web_tier_security_grp" {
    description = "subnet of the ec2"
    type = string
}
    
variable "availability_zone" {
    description = "availability zone of the ec2"
    type = list(string)
    default = ["ap-south-1a","ap-south-1b"]
}


variable "app_tier_subnet" {
    description = "subnet of the ec2"
    type = list(string)
}

variable "app_tier_security_grp" {
    description = "security group of the ec2"
    type = string
}
    
    