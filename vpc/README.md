# VPC Terraform Module

This VPC setup includes:

#subnets
- Two Public and six private subnets across two Availability Zones.
- Two public subnet for NAT gateway ,each two private subnets at two different zones for frontend(web_tier),backend(app_tier) and  database(data_tier).

#Routing
- Internet Gateway for internet access to the public subnet resources.
- NAT Gateway for private subnet internet access.
- Route tables and associations for proper traffic routing.


#Inputs
# Inputs

| Name               | Description                                                      |
|-------------------|------------------------------------------------------------------|
| cidr_block         | CIDR block for VPC                                               |
| name_prefix        | Name prefix for the subnets                                      |
| availability_zone  | Availability zones where subnets are created                     |
| public_cidr        | CIDR blocks for public subnets                                    |
| web_tier           | CIDR blocks for private subnets used by frontend instances       |
| app_tier           | CIDR blocks for private subnets used by backend instances        |
| data_tier          | CIDR blocks for private subnets used by databases                |
| enable_gateway     | Variable to define conditional creation of Elastic IP and NAT Gateway |
| route_cidr         | CIDR block for route tables                                       |

