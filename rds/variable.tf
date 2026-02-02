variable "data_subnet_ids" {
    description = "data subnet ids"
    type = list(string)
}

variable "engine_version" {
    description = "version of database"
    type = string
    default = "17.6"
}


variable "instance_class" {
    description = "instance class of database"
    type = string
    default = "db.t3.micro"
}


variable "allocated_storage" {
    description = "storage of database"
    type = number
    default = 20
}


variable "db_name" {
    description = "db_name of database"
    type = string
   
}


variable "db_username" {
    description = "db-username of database"
    type = string
    
}


variable "db_password" {
    description = "db_password of database"
    type = string
  
}


variable "security_group_id" {
    description = "security_group_id of database"
    type = string
}