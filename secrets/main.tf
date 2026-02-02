#create secrets for database
resource "aws_secretsmanager_secret" "db_secrets" {
  name = "database-secrets"
 
}


#Store the secrets credential value in secrets
resource "aws_secretsmanager_secret_version" "db_credential" {
  secret_id     = aws_secretsmanager_secret.db_secrets.id
  secret_string = jsonencode({
    
  db_name  = var.db_name
  username = var.db_username
  password = var.db_password


  })
  
}