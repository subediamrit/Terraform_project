variable "ami" {
    description = "AMI id"
    type = string
    default = "ami-02774d409be696d81"
}

variable "instance_type" {
    description = "Instance_type"
    type = string
    default = "t3.micro"
}

variable "subnet_id" {
    description = "bastion_subnet"
    type = string
}

variable "iam_instance_profile" {
    description = "Iam_instance_profile"
    type = string
}

variable "security_group_id" {
    description = "security group id for bastion"
    type = string
    
}

