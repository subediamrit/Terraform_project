This configuration creates a Secrets Manager secret to securely store database credentials such as the database name, username, and password.
It helps avoid hardcoding sensitive information in Terraform code or application configuration files.

| Resource                                          | Type                   | Description                                                   |
| ------------------------------------------------- | ---------------------- | ------------------------------------------------------------- |
| `aws_secretsmanager_secret.db_secrets`            | Secrets Manager Secret | Creates a secret to store database credentials                |
| `aws_secretsmanager_secret_version.db_credential` | Secret Version         | Stores database name, username, and password as a JSON secret |
