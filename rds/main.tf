#database subnet group
resource "aws_db_subnet_group" "data_subnet" {
  name       = "data-subnet"
  subnet_ids = var.data_subnet_ids

  tags = {
    Name = "My DB subnet group"
  }
}

#database parameter group
resource "aws_db_parameter_group" "database_parameter" {
  name   = "database-parameter"
  family = "postgres17"

  parameter {
    name  = "log_connections"
    value = "1"
  }

  parameter {
    name  = "log_disconnections"
    value = "1"
  }

  parameter {
    name  = "log_duration"
    value = "1"
  }

  tags = {
      Name = "postgress"
    }
}

#database
resource "aws_db_instance" "postgress_db" {
  identifier     = "postgress"
  engine         = "postgres"
  engine_version = var.engine_version

  instance_class    = var.instance_class
  allocated_storage = var.allocated_storage
  storage_type      = "gp3"
  storage_encrypted = true

  skip_final_snapshot       = true
  final_snapshot_identifier = "postgress"

  db_name  = var.db_name
  username = var.db_username
  password = var.db_password
  port     = 5432
 
  

  vpc_security_group_ids = [var.security_group_id]
  db_subnet_group_name   = aws_db_subnet_group.data_subnet.name
  parameter_group_name   = aws_db_parameter_group.database_parameter.name
  publicly_accessible = false
  

  tags = {
    Name = "postgress_database"
  }
}

