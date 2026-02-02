This configuration provisions a PostgreSQL RDS database inside private subnets using a custom DB subnet group and parameter group.
The database is not publicly accessible, uses encrypted storage, and enables logging for monitoring and troubleshooting.

| Resource                                    | Type                    | Description                                                           |
| ------------------------------------------- | ----------------------- | --------------------------------------------------------------------- |
| `aws_db_subnet_group.data_subnet`           | DB Subnet Group         | Defines private subnets where the RDS instance is deployed            |
| `aws_db_parameter_group.database_parameter` | DB Parameter Group      | Custom PostgreSQL parameters for connection and duration logging      |
| `aws_db_instance.postgress_db`              | RDS PostgreSQL Instance | Managed PostgreSQL database with encrypted storage and private access |
