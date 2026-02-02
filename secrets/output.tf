output "db_secret_arn" {
    value = aws_secretsmanager_secret.db_secrets.arn
}

output "db_name" {
  value = jsondecode(aws_secretsmanager_secret_version.db_credential.secret_string)["db_name"]
}


output "db_username" {
  value = jsondecode(aws_secretsmanager_secret_version.db_credential.secret_string)["username"]
}

output "db_password" {
  value = jsondecode(aws_secretsmanager_secret_version.db_credential.secret_string)["password"]
}
