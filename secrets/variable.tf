variable "recovery_days" {
    description = "recovery days"
    type = number
    default = 2
}

variable "db_name" {
    description = "database name"
    type = string
    default = "postgres_db"
}

variable "db_username" {
    description = "database username"
    type = string
    default = "amrit"
}

variable "db_password" {
    description = "daatabase password"
    type = string
    default = "amrit123"
}